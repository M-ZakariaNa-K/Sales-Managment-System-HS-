import 'package:dio/dio.dart';
import 'package:sales_management_system/Core/Components/sharedConstant.dart';
import 'package:sales_management_system/Core/helper/services/getTest.dart';
import 'package:sales_management_system/Models/pills/invoices_List_model.dart';

class GetPills2DateService {
  final Dio dio;

  GetPills2DateService(this.dio);

  Future<List<InvoiceModel>> getPills2DateService(
      {required dynamic startDate,
      required dynamic endDate,
      required String guid}) async {
    try {
      // Make sure the URL is correct and accessible
      Response response = await DioHelper().getData(
        token: token,
        path:
            "invoices/export?GUID=$guid&first_date=$startDate&last_date=$endDate",
      );
      if (response.statusCode == 200) {
        // Parse the JSON response data
        Map<String, dynamic> data = response.data;
        List<InvoiceModel> branchesList = [];
        //printdata["data"]);
        for (var branch in data["data"][0]) {
          InvoiceModel a = InvoiceModel(
            branch: branch["branch"],
            number: branch["number"],
            guid: branch["GUID"],
            spelledTotal: branch["spelled_total"],
            total: branch["total"],
            date: branch["Date"],
            rowNumber: branch["RowNumber"],
          );
          branchesList.add(a);
        }
        return branchesList;
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
