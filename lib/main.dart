import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sales_management_system/Core/Constants/theme.dart';
import 'package:sales_management_system/Core/helper/services/getTest.dart';
import 'package:sales_management_system/Core/helper/shared/LocaleController.dart';
import 'package:sales_management_system/Views/home/dashboard.dart';

void main() async {
// setting min and max with the same size to prevent resizing
  WidgetsFlutterBinding.ensureInitialized();

  DioHelper.init();
  runApp(const MyApp());
}
// NOTICE: Do not play anything else

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      title: 'Sales Management System App',
      // NOTE (From Zakaria): everyone when creating your task page
      // put the home page as your main working screen
      home: const DashboardPage(),

      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.robotoTextTheme(),
        fontFamily: GoogleFonts.roboto().fontFamily,
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
