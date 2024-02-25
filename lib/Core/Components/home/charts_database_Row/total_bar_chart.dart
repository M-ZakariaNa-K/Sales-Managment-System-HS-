import 'package:flutter/material.dart';
import 'package:sales_management_system/Core/Components/home/charts_database_Row/bar_chart.dart';
import 'package:sales_management_system/Core/Components/home/unload_sales_table.dart';

class TotalBarChart extends StatelessWidget {
  const TotalBarChart({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return  Container(
            width: MediaQuery.of(context).size.width * 0.4,
            height: 370,
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                width: 2,
                color: Colors.grey,
              ),
            ),
            child: BarChartFromAPI());
     
}
}