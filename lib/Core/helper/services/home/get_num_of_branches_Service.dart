import 'package:dio/dio.dart';
import 'package:sales_management_system/Core/Components/sharedConstant.dart';
import 'package:sales_management_system/Core/helper/services/getTest.dart';
import 'package:sales_management_system/Models/home/get_num_of_branchs.dart';

class GetNumOfBranchsService {
  final Dio dio;

  GetNumOfBranchsService(this.dio);

  Future<GetNumOfBranchsModel> getNumOfBranchsService() async {
    try {
      Response response = await DioHelper()
          .getData(path: "branches-Sales/num-of-branches", token: token);
      // Check if the response status code is 200 (OK)
      if (response.statusCode == 200) {
        // Parse the JSON response data
        Map<String, dynamic> data = response.data;
        GetNumOfBranchsModel numOfBranches;
        GetNumOfBranchsModel temp = GetNumOfBranchsModel(
          data: data["data"],
          code: data["code"],
          message: data['message'],
        );
        numOfBranches = temp;

        return numOfBranches;
      } else {
        // Handle the case where the response status code is not 200
        //print'Failed to get data. Status code: ${response.statusCode}');
        GetNumOfBranchsModel temp = GetNumOfBranchsModel(
          data: 0,
          code: 0,
          message: "null",
        );

        return temp;
      }
    } catch (e) {
      // Handle any errors that occur during the API call
      //print'Error fetching data: $e');
      GetNumOfBranchsModel temp = GetNumOfBranchsModel(
        data: 0,
        code: 0,
        message: "null",
      );

      return temp;
    }
  }
}
