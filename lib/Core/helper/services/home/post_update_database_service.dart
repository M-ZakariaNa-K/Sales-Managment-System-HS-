import 'package:dio/dio.dart';
import 'package:sales_management_system/Core/Components/sharedConstant.dart';

class PostUpdateDatabaseService {
  final Dio dio;
  PostUpdateDatabaseService(this.dio);
  Future<void> postUpdateAdminDatabaseService(
      {required String baseURL, required String choosenDatabase}) async {
    // Create an instance of Dio
    Dio dio = Dio();

    // Define the request data (URL, headers, body)
    String url = baseURL;
    Map<String, dynamic> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    Map<String, dynamic> body = {'name': choosenDatabase};

    try {
      // Send the POST request
      Response response = await dio.post(
        url,
        data: body,
        options: Options(headers: headers),
      );

      // Handle the response
      //print'Response status: ${response.statusCode}');
      //print'Response data: ${response.data}');
    } catch (e) {
      // Handle any errors
      //print'Error: $e');
    }
  }

  // Future<dynamic> postUpdateAdminDatabaseService(
  //     {required String baseURL, required String choosenDatabase}) async {
  //   dio.options.headers = {
  //     'Accept': 'application/json',
  //     'Authorization': 'Bearer $token'
  //   };
  //   Response response =
  //       await dio.post(baseURL, data: {"name": choosenDatabase});
  //   // DioHelper().postDataWithAuth(
  //   //   url: baseURL,
  //   //   token: token,
  //   //   data: {"name": "$choosenDatabase"},
  //   // );
  //   if (response.statusCode == 200) {
  //     Map<String, dynamic> data = response.data;
  //     //printdata["message"]);
  //     return data;
  //   } else {
  //     throw Exception(
  //         'there is a problem with status code ${response.statusCode} with body ${jsonDecode(response.data)}');
  //   }
  // }
}
