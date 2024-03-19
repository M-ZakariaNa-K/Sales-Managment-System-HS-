import 'package:dio/dio.dart';
import 'package:sales_management_system/Core/Components/sharedConstant.dart';
import 'package:sales_management_system/Core/helper/services/getTest.dart';
import 'package:sales_management_system/Models/home/get_greatest_branch_value.dart';

class GetGreatestBranchValueService {
  final Dio dio;

  GetGreatestBranchValueService(this.dio);

  Future<GetGreatestBranchValueDataModel>
      getGreatestBranchValueService() async {
    try {
      Response response = await DioHelper()
          .getData(path: "branches-Sales/getGreatestBranch", token: token);
      // Check if the response status code is 200 (OK)
      if (response.statusCode == 200) {
        // Parse the JSON response data
        Map<String, dynamic> data = response.data;
        GetGreatestBranchValueDataModel greatestBranch;
        GetGreatestBranchValueDataModel a = GetGreatestBranchValueDataModel(
          branch: data["data"]["branch"],
          number: data["data"]["number"],
          guid: data["data"]["GUID"],
          spelledTotal: data["data"]["spelled_total"],
          totalSales: data["data"]["total_Sales"],
        );
        greatestBranch = a;

        return greatestBranch;
      } else {
        // Handle the case where the response status code is not 200
        //print'Failed to get data. Status code: ${response.statusCode}');
        GetGreatestBranchValueDataModel a = GetGreatestBranchValueDataModel(
          branch: 'null',
          number: 'null',
          guid: 'null',
          spelledTotal: 'null',
          totalSales: 'null',
        );
        return a;
      }
    } catch (e) {
      // Handle any errors that occur during the API call
      //print'Error fetching data: $e');
      GetGreatestBranchValueDataModel a = GetGreatestBranchValueDataModel(
        branch: 'null',
        number: 'null',
        guid: 'null',
        spelledTotal: 'null',
        totalSales: 'null',
      );
      return a;
    }
  }
}
