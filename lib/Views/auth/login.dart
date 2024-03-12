import 'package:flutter/material.dart';
import 'package:sales_management_system/Views/auth/LoginScreenDesktopLayout.dart';
import 'package:sales_management_system/Views/auth/LoginScreenMobileLayout.dart';
import 'package:sales_management_system/Views/auth/LoginScreenTableLayout.dart';

class LoginScreen extends StatelessWidget {
  var userController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);

    final horizontalPadding = mediaQueryData.size.width;

    return LayoutBuilder(builder: (context, constraints) {
      if (horizontalPadding <= 600) {
        return MobileLayoutLoginScreen(context);
      } else if (horizontalPadding <= 1200) {
        return TabletLayoutLoginScreen(context);
      } else {
        return DesktopLayoutLoginScreen(context);
      }
    });
  }
}
