import 'package:dio/dio.dart';
import 'package:sales_management_system/Core/Components/sharedConstant.dart';
import 'package:sales_management_system/Core/helper/services/getTest.dart';
import 'package:sales_management_system/Models/home/get_sales_value_monthly.dart';

class GetSalesValueMonthlyService {
  final Dio dio;
  GetSalesValueMonthlyService(this.dio);

  Future<List<SalesInMonthModel>> getSalesValueMonthlyService() async {
    try {
      Response response = await DioHelper()
          .getData(path: "branches-Sales/GetSalesMonthly", token: token);

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
        //print'Failed to get data. Status code: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      //print'Error fetching data: $e');
      return [];
    }
  }
}
