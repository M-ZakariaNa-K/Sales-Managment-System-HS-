import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:sales_management_system/Core/Constants/theme.dart';

class SimpleBarChart extends StatelessWidget {
  final List<charts.Series<dynamic, String>> seriesList;
  final bool animate;
  const SimpleBarChart(this.seriesList, {super.key, required this.animate});

  factory SimpleBarChart.withSampleData() {
    return SimpleBarChart(
      _createSampleData(),
      animate: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return charts.BarChart(
      seriesList,
      animate: animate,
      defaultRenderer: charts.BarRendererConfig(
        cornerStrategy: const charts.ConstCornerStrategy(
          5,
        ), // Rounded corners with a radius of 20
        barRendererDecorator: charts.BarLabelDecorator<String>(
          outsideLabelStyleSpec: charts.TextStyleSpec(
            color: charts.ColorUtil.fromDartColor(Colors
                .transparent), // Set text color to transparent to hide the labels
          ),
          labelPosition: charts.BarLabelPosition.outside,
          insideLabelStyleSpec: charts.TextStyleSpec(
            fontSize: 14, // Adjust font size as needed
            color: charts.ColorUtil.fromDartColor(
                Colors.white), // Set text color for inside labels
          ),
        ),

        minBarLengthPx: 40, // Set the minimum width of bars in pixels
      ),
      domainAxis: charts.OrdinalAxisSpec(
        renderSpec: charts.SmallTickRendererSpec(
          labelStyle: charts.TextStyleSpec(
            fontSize: 12, // Adjust font size as needed
            color: charts.ColorUtil.fromDartColor(Colors
                .black), // Set text color for domain labels (month labels)
          ),
        ),
      ),
    );
  }

  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final data = [
      OrdinalSales('Jan', 45222),
      OrdinalSales('Feb', 25202),
      OrdinalSales('Mar', 100000),
      OrdinalSales('Apr', 7500),
      OrdinalSales('May', 75000),
      OrdinalSales('Jun', 3501),
      OrdinalSales('Jul', 65000),
      OrdinalSales('Aug', 15222),
      OrdinalSales('Sep', 9225),
      OrdinalSales('Oct', 73335),
      OrdinalSales('Nov', 75334),
      OrdinalSales('Dec', 15011),
    ];

    return [
      charts.Series<OrdinalSales, String>(
        id: 'Sales',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(
            ThemeColors.primary), // Change the color to red
        domainFn: (OrdinalSales sales, _) => sales.month,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}

class OrdinalSales {
  final String month;
  final int sales;

  OrdinalSales(this.month, this.sales);
}
