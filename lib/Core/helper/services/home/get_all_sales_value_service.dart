import 'package:dio/dio.dart';
import 'package:sales_management_system/Core/Components/sharedConstant.dart';
import 'package:sales_management_system/Core/helper/services/getTest.dart';
import 'package:sales_management_system/Models/home/get_all_sales_value.dart';

class AllSalesValuesService {
  final Dio dio;
  AllSalesValuesService(this.dio);

  Future<List<AllSalesValuesDataModel>> getAllSalesValues() async {
    try {
      //print'Ahmad');
      //printtoken);
      Response response = await DioHelper()
          .getData(path: "branches-Sales/getSalesValue", token: token);
      // await dio.get("$urlVar/api/branches-Sales/getSalesValue");
      // Check if the response status code is 200 (OK)
      if (response.statusCode == 200) {
        // Parse the JSON response data
        Map<String, dynamic> data = response.data;
        List<AllSalesValuesDataModel> dataList = [];

        for (var item in data["data"]) {
          AllSalesValuesDataModel a = AllSalesValuesDataModel(
            total: item["total"],
            spelledTotal: item["spelled_total"],
          );
          dataList.add(a);
        }
        return dataList;
      } else {
        // Handle the case where the response status code is not 200
        //print'Failed to get data. Status code: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      // Handle any errors that occur during the API call
      //print'Error fetching data: $e');
      return [];
    }
  }
}
