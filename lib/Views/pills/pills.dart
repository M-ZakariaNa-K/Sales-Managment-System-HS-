import 'package:flutter/material.dart';
import 'package:sales_management_system/Views/pills/pills_table_desktop_layout.dart';

class PillsPage extends StatelessWidget {
  const PillsPage(
    {
    super.key,
    required this.guid,
    required this.branchName,
    required this.total,
  });
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
  }
}
