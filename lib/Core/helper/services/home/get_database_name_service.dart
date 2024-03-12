import 'package:dio/dio.dart';
import 'package:sales_management_system/Core/Components/widget.dart';
import 'package:sales_management_system/Core/helper/services/getTest.dart';
import 'package:sales_management_system/Models/home/get_database_name_model.dart';
import 'package:sales_management_system/session.dart';

class GetDatabsNameService {
  final Dio dio;

  GetDatabsNameService(this.dio);

  Future<String> getDatabsNameService({required String baseUrl}) async {
    try {
      // Make sure the URL is correct and accessible
      // SessionManager sessionManager = SessionManager();
      // Response response = await sessionManager.get("http://127.0.0.1:8000/api/$baseUrl");
      Response response = await DioHelper().getData(
        token: token,
        path: baseUrl,
      );
      if (response.statusCode == 200) {
        // Parse the JSON response data
        Map<String, dynamic> data = response.data;
        GetDatabsNameModel databaseName = GetDatabsNameModel(
          name: data["data"]["name"],
        );
        return databaseName.name;
      } else {
        // Handle the case where the response status code is not 200
        print('Failed to get data. Status code: ${response.statusCode}');
        return "";
      }
    } catch (e) {
      // Handle any errors that occur during the API call
      print('Error fetching data: $e');
      return "";
    }
  }
}
