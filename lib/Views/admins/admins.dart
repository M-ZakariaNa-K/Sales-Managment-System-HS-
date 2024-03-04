import 'package:flutter/material.dart';
import 'package:sales_management_system/Core/Components/widget.dart';
import 'package:sales_management_system/Views/admins/desktopAdmins.dart';
import 'package:sales_management_system/Views/admins/mobileAdmins.dart';
import 'package:sales_management_system/Views/admins/tabletAdminsLayout.dart';

class AdminsPage extends StatelessWidget {
  const AdminsPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isAddAdmin = false;
    final MediaQueryData = MediaQuery.of(context);
    final horizontalPadding = MediaQueryData.size.width;
    final verticalPadding = MediaQueryData.size.height;
    return LayoutBuilder(builder: (context, constraints) {
      if (horizontalPadding <= 600) {
        return AdminsMobileLayout(context);
      } else
        return AdminsDisktopLayout(context);
    });
  }
}
