import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sales_management_system/Core/Constants/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sales_management_system/Core/helper/shared/LocaleController.dart';
import 'package:sales_management_system/Views/admins/admins.dart';
import 'package:sales_management_system/Views/auth/login.dart';
import 'package:sales_management_system/Views/pills/pills.dart';
import 'package:sales_management_system/Views/pills/pillsTable.dart';

import 'Core/Components/widget.dart';
import 'Models/pills/pills.dart';

void main() {
  runApp(const MyApp());
}

// NOTICE: Do not play anything else

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LocalController());
    PillsModel pill1 = PillsModel(
        code: 'code', branch: 'branch', number: 'number', total: 'total');
    PillsModel pill2 = PillsModel(
        code: 'code1', branch: 'branch1', number: 'number1', total: 'total1');
    pills.add(pill1);
    pills.add(pill2);
    const outlineInputBorder = OutlineInputBorder(
      borderSide: BorderSide(
        width: 1,
        color: Color.fromARGB(198, 0, 51, 102),
      ),
    );
    return GetMaterialApp(
      //translations: MyLocale(),
      locale: Locale('ar'),
      title: 'Sales Management System App',
      // NOTE (From Zakaria): everyone when creating your task page
      // put the home page as your main working screen
      home: PillsPage(),
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
