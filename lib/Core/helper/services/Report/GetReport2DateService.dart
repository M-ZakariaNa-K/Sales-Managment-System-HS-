import 'package:dio/dio.dart';
import 'package:sales_management_system/Core/Components/widget.dart';
import 'package:sales_management_system/Core/helper/services/getTest.dart';
import 'package:sales_management_system/Models/reports/GetReport2DateModel.dart';

class GetReport2DateService {
  final Dio dio;

  GetReport2DateService(this.dio);

  Future<List<ReportDataModel>> getReport2DateService(
      {required dynamic startDate, required dynamic endDate}) async {
    try {
      // Make sure the URL is correct and accessible
      Response response = await DioHelper().getData(
        token: token,
        path:
            "branches-Sales/Branches-between-date?start_date=$startDate&end_date=$endDate",
      );
      if (response.statusCode == 200) {
        // Parse the JSON response data
        Map<String, dynamic> data = response.data;
        List<ReportDataModel> branchesList = [];
        print(data["data"]);
        for (var branch in data["data"][0]) {
          ReportDataModel a = ReportDataModel(
              branch: branch["branch"],
              totalSales: branch["total_Sales"],
              number: branch["number"],
              guid: branch["GUID"],
              spelledTotal: branch["spelled_total"],
              total: branch["total"]);
          branchesList.add(a);
        }
        for (var branch in data["data"][1]) {
          print(branch);
          ReportDataModel a = ReportDataModel(
              total: branch["total"], spelledTotal: branch["spelled_total"]);
          branchesList.add(a);
        }
        return branchesList;
      } else {
        // Handle the case where the response status code is not 200
        print('Failed to get data. Status code: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      // Handle any errors that occur during the API call
      print('Error fetching data: $e');
      return [];
    }
  }
}
