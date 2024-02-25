import 'package:dio/dio.dart';
import 'package:sales_management_system/Core/helper/shared/shared.dart';
import 'package:sales_management_system/Models/home/get_sales_value_monthly.dart';

class GetSalesValueMonthlyService {
  final Dio dio;
  GetSalesValueMonthlyService(this.dio);

  Future<List<SalesInMonthModel>> getSalesValueMonthlyService() async {
    try {
      dio.options.headers = {
        'Authorization': 'Bearer $tokenVar',
      };

      Response response = await dio.get(
        '$urlVar/api/branches-Sales/GetSalesMonthly',
      );

      if (response.statusCode == 200) {
        List<dynamic> jsonData = response.data['data'];
        List<SalesInMonthModel> salesData = jsonData.map((item) {
          return SalesInMonthModel(
            month: item['month'],
            total: item['total'],
          );
        }).toList();

        return salesData;
      } else {
        print('Failed to get data. Status code: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      print('Error fetching data: $e');
      return [];
    }
  }
}
