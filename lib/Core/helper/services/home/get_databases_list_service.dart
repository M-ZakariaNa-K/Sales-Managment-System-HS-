import 'package:dio/dio.dart';
import 'package:sales_management_system/Core/Components/widget.dart';
import 'package:sales_management_system/Core/helper/shared/shared.dart';
import 'package:sales_management_system/Models/home/get_databases_list_model.dart';

class GetDatabasesListService {
  final Dio dio;

  GetDatabasesListService(this.dio);

  Future<List<GetDatabasesListDataModel>> getDatabasesListService() async {
    try {
      // Make sure the URL is correct and accessible
      dio.options.headers = {'Authorization': 'Bearer $token'};

      Response response = await dio.get("$urlVar/api/databases/list");
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
