import 'dart:html';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sales_management_system/Core/Components/widget.dart';
import 'package:sales_management_system/Core/Constants/theme.dart';
import 'package:sales_management_system/Core/helper/services/getTest.dart';
import 'package:sales_management_system/Core/helper/shared/Locale.dart';
import 'package:sales_management_system/Core/helper/shared/LocaleController.dart';
import 'package:sales_management_system/Views/admins/admins.dart';
import 'package:sales_management_system/Views/auth/login.dart';
// import 'dart:html' as html;
import 'package:localstorage/localstorage.dart';
import 'package:sales_management_system/Views/home/dashboard.dart';
import 'package:sales_management_system/Views/home/home.dart';
import 'package:sales_management_system/Views/home/splash_view.dart';

// void saveCurrentRoute(String route) {
//   html.window.localStorage['lastRoute'] = route;
// }

void storeToken(String token) {
  window.localStorage['token'] = token;
}

String? retrieveToken() {
  return window.localStorage['token'];
}

void main() async {
// setting min and max with the same size to prevent resizing
  WidgetsFlutterBinding.ensureInitialized();

  DioHelper.init();
  if (retrieveToken() != null) token = retrieveToken()!;
  // String lastRoute = html.window.localStorage['lastRoute'] ?? '/';

  runApp(const MyApp(
      // startRoute: lastRoute,
      ));
}
// NOTICE: Do not play anything else

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  // final String startRoute;
 const MyApp({
    Key? key,
    // required this.startRoute
  });

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
      //translations: MyLocale(),
      locale: const Locale('ar'),
      translations: MyLocale(),
      title: 'Alnasser Food Company',
      // NOTE (From Zakaria): everyone when creating your task page
      // put the home page as your main working screen
      home: SplashScreen(),

      // getPages: [
      //   // GetPage(name: '/Login', page: () => LoginScreen()),
      //   // GetPage(name: '/Admins', page: () => const AdminsPage()),
      //   // GetPage(name: '/DashBoard', page: () => const DashboardPage()),
      //   // GetPage(name: '/Pills', page: () => LoginScreen()),
      //   // GetPage(name: '/Login', page: () => LoginScreen()),
      // ],
      // initialRoute: startRoute,

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

// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }


// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     _checkAuthStatus();
//   }

//   Future<void> _checkAuthStatus() async {
//     await storage.ready;
//     bool isLoggedIn = storage.getItem('isLoggedIn') ?? false;
//     print(isLoggedIn);
//     // Navigate to the appropriate screen based on the authentication status.
//     Navigator.of(context).pushReplacement(
//       MaterialPageRoute(
//         builder: (context) => isLoggedIn ? const DashboardPage() : LoginScreen(),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: Center(
//         child: CircularProgressIndicator(),
//       ),
//     );
//   }
// }
