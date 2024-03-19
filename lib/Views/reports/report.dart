import 'package:flutter/material.dart';
import 'package:sales_management_system/Views/reports/reports_desktop_layout.dart';
import 'package:sales_management_system/Views/reports/reports_mobile_layout.dart';

class ReportsPage extends StatelessWidget {
  const ReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);

    final horizontalPadding = mediaQueryData.size.width;

    return LayoutBuilder(builder: (context, constraints) {
      if (horizontalPadding <= 800) {
        return MobileLayoutReportsPage(context);
      } else {
        return DesktopLayoutReportsPage(context);
      }
    });
  }
}
