import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:get/get.dart';
import 'package:sales_management_system/Core/Components/home/unload_sales_table.dart';
import 'package:sales_management_system/Core/Constants/theme.dart';
import 'package:sales_management_system/Core/helper/services/home/getSalesValueMonthly.dart';
import 'package:sales_management_system/Models/home/get_sales_value_monthly.dart';

class BarChartFromAPI extends StatefulWidget {
  const BarChartFromAPI({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _BarChartFromAPIState createState() => _BarChartFromAPIState();
}

class _BarChartFromAPIState extends State<BarChartFromAPI> {
  List<SalesInMonthModel> _data = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  void _fetchData() async {
    try {
      List<SalesInMonthModel> data = await GetSalesValueMonthlyService(Dio())
          .getSalesValueMonthlyService();

      if (mounted) {
        setState(() {
          _data = data;
          _loading = false;
        });
      }
    } catch (e) {
      print('Error fetching data: $e');
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _loading
          ? UnloadedItem(
              width: MediaQuery.of(context).size.width,
              height: 370,
            )
          : _data.isNotEmpty
              ? _buildChart()
              : Text('48'.tr),
    );
  }

  Widget _buildChart() {
    List<charts.Series<SalesInMonthModel, String>> series = [
      charts.Series<SalesInMonthModel, String>(
        id: '49'.tr,
        data: _data,
        domainFn: (SalesInMonthModel sales, _) => sales.month.toString(),
        measureFn: (SalesInMonthModel sales, _) =>
            double.parse(sales.total.toString()),
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(ThemeColors.primary),
        displayName: '49'.tr,
      ),
    ];

    return charts.BarChart(
      series,
      animate: true,
      vertical: true,
      domainAxis: charts.OrdinalAxisSpec(
        renderSpec: charts.SmallTickRendererSpec(
          labelStyle: charts.TextStyleSpec(
            color: charts.ColorUtil.fromDartColor(
              ThemeColors.primary,
            ),
          ),
        ),
      ),
      defaultRenderer: charts.BarRendererConfig(
        cornerStrategy: const charts.ConstCornerStrategy(5),
      ),
    );
  }
}
