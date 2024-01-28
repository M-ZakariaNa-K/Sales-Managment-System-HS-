import 'package:flutter/material.dart';
import 'package:sales_management_system/Core/Constants/theme.dart';
import 'package:google_fonts/google_fonts.dart';
void main() {
  runApp(const MyApp());
}

// NOTICE: Do not play anything else

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const outlineInputBorder = OutlineInputBorder(
      borderSide: BorderSide(
        width: 1,
        color: Color.fromARGB(198, 0, 51, 102),
      ),
    );
    return MaterialApp(
      title: 'Sales Management System App',
      // NOTE (From Zakaria): everyone when creating your task page
      // put the home page as your main working screen
      // home:,
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.robotoTextTheme(),
        fontFamily: GoogleFonts.roboto().fontFamily,
        colorScheme: ColorScheme.fromSeed(
          seedColor: ThemeColors.primary,
          secondary: ThemeColors.secondary,
          outline: const Color.fromARGB(198, 0, 51, 102),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: outlineInputBorder,
          enabledBorder: outlineInputBorder,
          focusedBorder: outlineInputBorder,
          prefixIconColor: Color(0xFF003366),
          outlineBorder: BorderSide(
            width: .8,
            color: Color.fromARGB(198, 0, 51, 102),
          ),
          hintStyle: TextStyle(
            color: Color.fromARGB(198, 0, 51, 102),
          ),
        ),
      ),
    );
  }
}
