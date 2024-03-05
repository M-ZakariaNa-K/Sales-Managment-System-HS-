import 'package:dio/dio.dart';
import 'package:sales_management_system/Core/Components/widget.dart';
import 'package:sales_management_system/Core/helper/services/getTest.dart';
import 'package:sales_management_system/Models/pills/invoices_List_model.dart';

class GetInvoiceListService {
  final Dio dio;

  GetInvoiceListService(this.dio);

  Future<Map<String, dynamic>> fetchInvoices(
      {required String guid, required int page}) async {
    try {
      // Replace 'YOUR_API_ENDPOINT' with your actual API endpoint
      Response response = await DioHelper().getData(
        // path:
        //     "invoices/list?GUID=D910ED68-343B-4479-838A-81038767AEDA&page=$page",
        path: "invoices/list?GUID=$guid&page=$page",
        token: token,
      );
      Map<String, dynamic> data = response.data;
      List<InvoiceModel> invoiceList = [];
      List<PaginationModel> paginationList = [];
      Map<String, dynamic> allDataMap = {};

      if (response.statusCode == 200) {
        // If the server returns a 200 OK response, parse the JSON
        for (int i = 0; i < data["data"]["invoices"].length; i++) {
          InvoiceModel temp = InvoiceModel(
              guid: data["data"]["invoices"][i]["GUID"],
              rowNumber: data["data"]["invoices"][i]["RowNumber"],
              branch: data["data"]["invoices"][i]["Branch"],
              date: data["data"]["invoices"][i]["Date"],
              total: data["data"]["invoices"][i]["Total"],
              number: data["data"]["invoices"][i]["Number"],
              spelledTotal: data["data"]["invoices"][i]["spelled_total"]);
          invoiceList.add(temp);
        }
        PaginationModel temp = PaginationModel(
            currentPage: data["data"]["pagination"]["current_page"],
            total: data["data"]["pagination"]["total"],
            lastPage: data["data"]["pagination"]["last_page"],
            nextPage: data["data"]["pagination"]["next_page"],
            prevPage: data["data"]["pagination"]["prev_page"]);
        paginationList.add(temp);
        allDataMap["invoices"] = invoiceList;
        allDataMap["pagination"] = paginationList;
        return allDataMap;
      } else if (response.statusCode == 404) {
        return {};
      } else {
        // If the server returns an error response, throw an exception
        throw Exception('Failed to fetch invoices');
      }
    } catch (e) {
      // If an error occurs during the request, throw an exception
      throw Exception('Failed to fetch invoices: $e');
    }
  }
}

// import 'package:dio/dio.dart';
// import 'package:sales_management_system/Core/Components/widget.dart';
// import 'package:sales_management_system/Core/helper/services/getTest.dart';
// import 'package:sales_management_system/Models/pills/invoices_List_model.dart';

// class GetInvoiceListService {
//   final Dio dio;

//   GetInvoiceListService(this.dio);

//   Future< List<InvoiceModel>> fetchInvoices(
//       {required String guid, required int page}) async {
//     try {
//       // Replace 'YOUR_API_ENDPOINT' with your actual API endpoint
//       Response response = await DioHelper().getData(
//         // path: "invoices/list?GUID=$guid&page=$page",
//         path: "invoices/list?GUID=241CD19C-5BC4-4373-BF92-8633191BF33B&page=2",
//         token: token,
//       );
//       Map<String, dynamic> data = response.data;
//       List<InvoiceModel> invoiceList = [];
//       // List<PaginationModel> paginationList = [];
//       // List<dynamic> allDataMap = [];
//       if (response.statusCode == 200) {
//         // If the server returns a 200 OK response, parse the JSON
//         for (int i = 0; i < data["data"]["invoices"].length; i++) {
//           InvoiceModel temp = InvoiceModel(
//               guid: data["data"]["invoices"][i]["GUID"],
//               rowNumber: data["data"]["invoices"][i]["RowNumber"],
//               branch: data["data"]["invoices"][i]["Branch"],
//               date: data["data"]["invoices"][i]["Date"],
//               total: data["data"]["invoices"][i]["Total"],
//               number: data["data"]["invoices"][i]["Number"],
//               spelledTotal: data["data"]["invoices"][i]["spelled_total"]);
//           invoiceList.add(temp);
//         }
//         // PaginationModel temp = PaginationModel(
//         //     currentPage: data["data"]["pagination"]["current_page"],
//         //     total: data["data"]["pagination"]["total"],
//         //     lastPage: data["data"]["pagination"]["last_page"],
//         //     nextPage: data["data"]["pagination"]["next_page"],
//         //     prevPage: data["data"]["pagination"]["prev_page"]);
//         // paginationList.add(temp);
//         // allDataMap.add(invoiceList);
//         // allDataMap.add(paginationList);
//         // ["invoices"] = invoiceList;
//        // allDataMap["pagination"] = paginationList;

//         return invoiceList;
//       } else {
//         // If the server returns an error response, throw an exception
//         throw Exception('Failed to fetch invoices');
//       }
//     } catch (e) {
//       // If an error occurs during the request, throw an exception
//       throw Exception('Failed to fetch invoices: $e');
//     }
//   }
// }
