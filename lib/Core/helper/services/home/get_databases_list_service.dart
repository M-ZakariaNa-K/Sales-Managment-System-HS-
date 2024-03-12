import 'package:dio/dio.dart';
import 'package:sales_management_system/Core/Components/widget.dart';
import 'package:sales_management_system/Core/helper/services/getTest.dart';
import 'package:sales_management_system/Models/home/get_databases_list_model.dart';
import 'package:sales_management_system/main.dart';
import 'package:sales_management_system/session.dart';

class GetDatabasesListService {
  final Dio dio;

  GetDatabasesListService(this.dio);

  Future<List<GetDatabasesListDataModel>> getDatabasesListService() async {
    try {
      Response response =
          await DioHelper().getData(path: "databases/list", token: token);
      // sessionManager.setToken(token); // Ensure the token is set

      // Response response = await sessionManager
      //     .get("http://127.0.0.1:8000/api/databases/list");
      // Check if the response status code is 200 (OK)
      if (response.statusCode == 200) {
        // Parse the JSON response data
        Map<String, dynamic> data = response.data;
        List<GetDatabasesListDataModel> databasesList = [];

        for (var database in data["data"]) {
          GetDatabasesListDataModel a = GetDatabasesListDataModel(
            databaseName: database["database_name"],
          );
          databasesList.add(a);
        }
        return databasesList;
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
