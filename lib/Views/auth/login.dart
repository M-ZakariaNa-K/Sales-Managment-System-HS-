import 'package:flutter/material.dart';
import 'package:sales_management_system/Views/auth/LoginScreenDesktopLayout.dart';
import 'package:sales_management_system/Views/auth/LoginScreenMobileLayout.dart';
import 'package:sales_management_system/Views/auth/LoginScreenTableLayout.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
    static var userController = TextEditingController();
    static var passwordController = TextEditingController();
    static var hostController = TextEditingController();
    static var hostPasswordController = TextEditingController();
    static var formKey = GlobalKey<FormState>();
    static bool hostIsEnable = false;

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);

    final horizontalPadding = mediaQueryData.size.width;

    return LayoutBuilder(builder: (context, constraints) {
      if (horizontalPadding <= 850) {
        return MobileLayoutLoginScreen(context);
      } else if (horizontalPadding <= 1200) {
        return TabletLayoutLoginScreen(context);
      } else {
        return DesktopLayoutLoginScreen(context);
      }
    });
  }
}
