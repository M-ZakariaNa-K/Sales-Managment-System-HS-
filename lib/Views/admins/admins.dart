import 'package:flutter/material.dart';
import 'package:sales_management_system/Views/admins/desktopAdmins.dart';
import 'package:sales_management_system/Views/admins/mobileAdmins.dart';
import 'package:sales_management_system/Views/admins/tabletAdminsLayout.dart';

class AdminsPage extends StatelessWidget {
  const AdminsPage({super.key});

  @override
  Widget build(BuildContext context) {
    
    final MediaQueryData = MediaQuery.of(context);
    final horizontalPadding = MediaQueryData.size.width;
    return LayoutBuilder(builder: (context, constraints) {
      if (horizontalPadding <= 600) {
        return AdminsMobileLayout(context);
      } else if (horizontalPadding <= 1270) {
        return AdminsTabletLayout(context);
      } else{
        return AdminsDisktopLayout(context);
      }
    });
  }
}
