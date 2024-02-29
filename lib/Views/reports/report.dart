import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;

import 'package:sales_management_system/Core/Components/custome_elevated_button.dart';
import 'package:sales_management_system/Core/Components/widget.dart';
import 'package:sales_management_system/Core/Constants/theme.dart';
import 'package:sales_management_system/Views/reports/reports_desktop_layout.dart';
import 'package:sales_management_system/Views/reports/reports_mobile_layout.dart';

class ReportsPage extends StatelessWidget {
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
