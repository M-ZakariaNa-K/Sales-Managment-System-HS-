import 'package:flutter/material.dart';
import 'package:sales_management_system/Core/Components/home/charts_database_Row/total_bar_chart.dart';
import 'package:sales_management_system/Core/Components/home/charts_database_Row/total_database.dart';
import 'package:sales_management_system/Core/helper/shared/shared.dart';

class ChartsDatabaseRow extends StatefulWidget {
  const ChartsDatabaseRow({
    super.key,
  });

  @override
  State<ChartsDatabaseRow> createState() => _ChartsDatabaseRowState();
}

class _ChartsDatabaseRowState extends State<ChartsDatabaseRow> {
  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        //1
        Expanded(child: TotalBarChart()),
        // 2 //----------------------------------to choose database----------------------------
        TotalDatabase(),
      ],
    );
  }
}
