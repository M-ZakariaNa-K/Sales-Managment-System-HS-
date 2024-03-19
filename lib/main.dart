import 'dart:html';
import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sales_management_system/Core/Components/components.dart';

import 'package:sales_management_system/Core/Components/sharedConstant.dart';
import 'package:sales_management_system/Core/Constants/theme.dart';
import 'package:sales_management_system/Core/helper/services/Local.dart';
import 'package:sales_management_system/Core/helper/services/getTest.dart';
import 'package:sales_management_system/Core/helper/shared/Locale.dart';
import 'package:sales_management_system/Core/helper/shared/LocaleController.dart';
import 'package:sales_management_system/Views/admins/admins.dart';
import 'package:sales_management_system/Views/auth/login.dart';
import 'package:sales_management_system/Views/home/dashboard.dart';
import 'package:sales_management_system/Views/reports/report.dart';

//rony
final box = GetStorage();
void saveCurrentRoute(String route) {
  //html.window.localStorage['lastRoute'] = route;
  box.write('lastRoute', route);
}

void storeToken(String token, bool isUserAdmin, bool isExcel, bool isPdf) {
  window.localStorage['token'] = token;
  box.write('isUserAdmin', isUserAdmin);
  box.write('isExcel', isExcel);
  box.write('isPdf', isPdf);
  // CacheHelper.saveData(key: 'isUserAdmin', value: isUserAdmin);
  // CacheHelper.saveData(key: 'isExcel', value: isExcel);
  // CacheHelper.saveData(key: 'isPdf', value: isPdf);
}

String? retrieveToken() {
  return window.localStorage['token'];
}

void retrieveisUserPerm() {
  isUserAdmin = box.read('isUserAdmin');
  isExcel = box.read('isExcel');
  isPdf = box.read('isPdf');
  // isUserAdmin = CacheHelper.getData(key: 'isUserAdmin');
  // isExcel = CacheHelper.getData(key: 'isExcel');
  // isPdf = CacheHelper.getData(key: 'isPdf');
}

RestartableTimer? tokenRemovalTimer;

void removeTokenAfter(Duration duration) {
  // log(DateTime.now().toString());
  tokenRemovalTimer = RestartableTimer(duration, removeToken);
}

void removeToken() async {
  await DioHelper().getData(path: 'users/logout', token: token).then((value) {
    showToast(text: "Session has been expired", state: ToastStates.SUCCESS);
    token = '';
    window.localStorage.remove('token');
    Get.offAndToNamed('/Login');
  });
}

void stopTokenRemovalTimer() {
  tokenRemovalTimer?.cancel();
}

void main() async {
// setting min and max with the same size to prevent resizing
  WidgetsFlutterBinding.ensureInitialized();

  DioHelper.init();

  CacheHelper.init();
  if (retrieveToken() != null) token = retrieveToken()!;
  //isUserAdmin = retrieveBooleanValue(window.localStorage['isUserAdmin']);
  //retrieveisUserPerm();
  //String lastRoute = html.window.localStorage['lastRoute'] ?? '/';
  String lastRoute = box.read('lastRoute') ?? '/';

  await GetStorage.init();
  runApp(MyApp(
    startRoute: lastRoute,
  ));
}
// NOTICE: Do not play anything else

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  final String startRoute;
  const MyApp({super.key, required this.startRoute});

  @override
  Widget build(BuildContext context) {
    Get.put(LocalController());
    const outlineInputBorder = OutlineInputBorder(
      borderSide: BorderSide(
        width: 1,
        color: ThemeColors.secondary,
      ),
    );
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: const Locale('ar'),
      translations: MyLocale(),
      title: 'Alnasser Food Company',
      // NOTE (From Zakaria): everyone when creating your task page
      // put the home page as your main working screen
      home: LoginScreen(),

      getPages: [
        GetPage(name: '/Login', page: () => LoginScreen()),
        GetPage(name: '/Admins', page: () => const AdminsPage()),
        GetPage(name: '/DashBoard', page: () => const DashboardPage()),
        GetPage(name: '/Reports', page: () => ReportsPage()),
      ],
      initialRoute: startRoute,

      theme: ThemeData(
        useMaterial3: true,
        // textTheme: GoogleFonts.robotoTextTheme(),
        // fontFamily: GoogleFonts.roboto().fontFamily,
        colorScheme: ColorScheme.fromSeed(
          seedColor: ThemeColors.primary,
          secondary: ThemeColors.secondary,
          outline: ThemeColors.secondary,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: outlineInputBorder,
          enabledBorder: outlineInputBorder,
          focusedBorder: outlineInputBorder,
          prefixIconColor: ThemeColors.secondary,
          outlineBorder: BorderSide(
            width: .8,
            color: ThemeColors.secondary,
          ),
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
