import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:google_fonts/google_fonts.dart';
import 'package:sales_management_system/Core/Constants/theme.dart';
=======
import 'package:sales_management_system/Core/Constants/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sales_management_system/Views/home/home.dart';

>>>>>>> 6cb49abeb288eaa71edb7ec1352fbb69b92ae188
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
<<<<<<< HEAD
      // home:,
=======
      home: HomePage(),
>>>>>>> 6cb49abeb288eaa71edb7ec1352fbb69b92ae188
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.robotoTextTheme(),
        fontFamily: GoogleFonts.roboto().fontFamily,
        colorScheme: ColorScheme.fromSeed(
          seedColor: ThemeColors.primary,
          secondary: ThemeColors.secondary,
<<<<<<< HEAD
          outline: const Color.fromARGB(198, 0, 51, 102),
=======
          outline:  ThemeColors.secondary,
>>>>>>> 6cb49abeb288eaa71edb7ec1352fbb69b92ae188
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: outlineInputBorder,
          enabledBorder: outlineInputBorder,
          focusedBorder: outlineInputBorder,
<<<<<<< HEAD
          prefixIconColor: Color(0xFF003366),
          outlineBorder: BorderSide(
            width: .8,
            color: Color.fromARGB(198, 0, 51, 102),
          ),
          hintStyle: TextStyle(
            color: Color.fromARGB(198, 0, 51, 102),
=======
          prefixIconColor: ThemeColors.secondary,
          outlineBorder: BorderSide(
            width: .8,
            color: ThemeColors.secondary,
          ),
          hintStyle: TextStyle(
            color: Colors.grey,
>>>>>>> 6cb49abeb288eaa71edb7ec1352fbb69b92ae188
          ),
        ),
      ),
    );
  }
}
