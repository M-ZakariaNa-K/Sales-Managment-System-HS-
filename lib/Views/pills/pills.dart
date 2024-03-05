import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:sales_management_system/Views/pills/pills_table_mobile_layout.dart';
import 'package:sales_management_system/Views/pills/pills_table_desktop_layout.dart';

class PillsPage extends StatelessWidget {
  const PillsPage(
    BuildContext context, {
    super.key,
    required this.guid,
    required this.branchName,
    required this.total,
  });

  // DateTime? selectedStartDateRange;
  final String guid;
  final String branchName;
  final dynamic total;

  @override
  Widget build(BuildContext context) {
    return DesktopLayoutPillsPage(
      context,
      guid: guid,
      branchName: branchName,
      total: total,
    );
    // LayoutBuilder(builder: (context, constraints) {
    //   if (horizontalPadding <= 800) {
    //     return MobileLayoutPillsPage(
    //       context,
    //       guid: guid,
    //       branchName: branchName,
    //       total: total,
    //     );
    //   } else {
    //     return DesktopLayoutPillsPage(

    //       context,
    //       guid: guid,
    //       branchName: branchName,
    //       total: total,
    //     );
    //   }
    // });
  }
}
