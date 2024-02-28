import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:sales_management_system/Core/helper/services/getTest.dart';
import 'package:sales_management_system/Core/helper/shared/shared.dart';

class PostUpdateDatabaseService {
  final Dio dio;
  final String? choosenDatabase;
  PostUpdateDatabaseService(this.dio, this.choosenDatabase);

  Future<dynamic> postUpdateAdminDatabaseService(
      {required String baseURL}) async {
    Response response = await DioHelper().postDataWithAuth(
      url: baseURL,
      token: tokenVar,
      data: {
        "name": choosenDatabase ?? "",
      },
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> data = response.data;
      return data;
    } else {
      throw Exception(
          'there is a problem with status code ${response.statusCode} with body ${jsonDecode(response.data)}');
    }
  }
}
