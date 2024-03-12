import 'package:dio/dio.dart';
import 'package:sales_management_system/Core/Components/widget.dart';
import 'package:sales_management_system/Core/helper/services/getTest.dart';
import 'package:sales_management_system/Models/home/get_profile_model.dart';
import 'package:sales_management_system/main.dart';

import '../../../../session.dart';

class GetprofileService {
  final Dio dio;

  GetprofileService(this.dio);

  Future<GetProfileDataModel> getprofileService() async {
    try {
      // Make sure the URL is correct and accessible
      Response response = await DioHelper().getData(
        token: token,
        path: "users/get-current",
      );
      // sessionManager.setToken(token); // Ensure the token is set

      // Response response = await sessionManager
      //     .get("http://127.0.0.1:8000/api/users/get-current");
      if (response.statusCode == 200) {
        // Parse the JSON response data
        Map<String, dynamic> data = response.data;
        GetProfileDataModel profileData = GetProfileDataModel(
          id: data["data"]["id"],
          name: data["data"]["name"],
          username: data["data"]["username"],
          password: data["data"]["password"],
          permissions: data["data"]["permissions"],
        );
        return profileData;
      } else {
        // Handle the case where the response status code is not 200
        print('Failed to get data. Status code: ${response.statusCode}');
        return GetProfileDataModel(
          id: 0,
          name: "",
          username: "",
          password: "",
          permissions: [],
        );
      }
    } catch (e) {
      // Handle any errors that occur during the API call
      print('Error fetching data: $e');
      return GetProfileDataModel(
        id: 0,
        name: "",
        username: "",
        password: "",
        permissions: [],
      );
    }
  }
}
