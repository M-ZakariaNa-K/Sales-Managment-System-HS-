import 'package:dio/dio.dart';
import 'package:sales_management_system/Core/Components/widget.dart';
import 'package:sales_management_system/Core/helper/services/getTest.dart';
import 'package:sales_management_system/Models/pills/invoices_search_model.dart';

class PillsSearchService {
  PillsSearchService(this.dio);
  final Dio dio;

  Future<InvoicesSearchDataModel> getsearchapp(
      {required String query, required String guid}) async {
    // Add connectTimeout and receiveTimeout to handle timeouts
    dio.options.connectTimeout = const Duration(seconds: 30); // 30 seconds
    dio.options.receiveTimeout = const Duration(seconds: 20); // 20 seconds

    try {
      Response response = await DioHelper().getData(
        path:
           // "invoices/search?GUID=241CD19C-5BC4-4373-BF92-8633191BF33B&search=322",
    "invoices/search?GUID=$guid&search=$query",
        token: token,
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> data = response.data;
        print(data);
        List<dynamic> invoices = data['data']['invoices'] as List<dynamic>;
        List<InvoicefiveSearchDataModel> invoicesList = [];
        print("sadxacascmak;cacknalkcnklncaklcnalcnlkcascaslkvna");
        for (int i = 0; i < invoices.length; i++) {
          InvoicefiveSearchDataModel temp = InvoicefiveSearchDataModel(
            branch: invoices[i]["Branch"],
            guid: invoices[i]["GUID"],
            number: invoices[i]["Number"],
            total: invoices[i]["Total"],
            spelledTotal: invoices[i]["Spelled Total"],
            date: invoices[i]["Date"],
          );
          invoicesList.add(temp);
        }
        // List<InvoiceSearchDataModel> invoicesList = invoices
        //     .map((json) => InvoiceSearchDataModel.fromJson(json))
        //     .toList();
        print(invoicesList);
        return InvoicesSearchDataModel(invoices: invoicesList);
      } else if (response.statusCode == 429) {
        throw Exception('Too many requests. Please try again later.');
      } else {
        throw Exception(
            'Failed to fetch data. Status code: ${response.statusCode}');
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 429) {
        throw Exception('Too many requests. Please try again');
      } else {
        throw Exception('Error fetching data. Please try again');
      }
    }
  }
}
