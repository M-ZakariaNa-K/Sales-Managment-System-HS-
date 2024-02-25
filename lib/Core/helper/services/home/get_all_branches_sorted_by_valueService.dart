import 'package:dio/dio.dart';
import 'package:sales_management_system/Core/helper/services/getTest.dart';
import 'package:sales_management_system/Core/helper/shared/shared.dart';
import 'package:sales_management_system/Models/home/get_all_branches.dart';

class GetAllBranchesSortedByValueService {
  final Dio dio;
  GetAllBranchesSortedByValueService(this.dio);

  Future<List<BranchDataModel>> getAllBranchesService() async {
    try {
      // Make sure the URL is correct and accessible
      Response response = await DioHelper().getData(
        token: tokenVar,
        baseURL: "branches-Sales/getSortedBranches",
      );
      // Check if the response status code is 200 (OK)
      if (response.statusCode == 200) {
        // Parse the JSON response data
        Map<String, dynamic> data = response.data;
        List<BranchDataModel> branchesList = [];
        for (var branch in data["data"]) {
          BranchDataModel a = BranchDataModel(
            branch: branch["branch"],
            totalSales: branch["total_Sales"],
            number: branch["number"],
            guid: branch["GUID"],
            spelledTotal: branch["spelled_total"],
          );

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
