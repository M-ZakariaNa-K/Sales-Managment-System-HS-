// ignore_for_file: file_names

import 'package:dio/dio.dart';
import 'package:sales_management_system/Core/Components/components.dart';

//showTOast: it's like a dialog has a color and text (the text is the
//response message and the colors is ToastStates.SUCCESSFUL of ToastStates.ERROR)
//be sure we have the same components
class DioHelper {
  static late Dio dio;

  //init function should invoke in main function before runApp()
  static init() {
    dio = Dio(BaseOptions(
      //this URL is Our API and we will write it here and just here
      //every method in this class has a base url parameter (this API)
      baseUrl: 'http://127.0.0.1:8000/api/',
      receiveDataWhenStatusError: true,
      // connectTimeout: Duration(seconds: 5 ),
      //   receiveTimeout : Duration(seconds: 3)
    ));
  }

  Future<Response> getData(
      {required String path,
      Map<String, dynamic>? query,
      Map<String, dynamic>? body,
      String? token}) async {
    dio.options.headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    return await dio
        .get(path, data: body)
        // ignore: body_might_complete_normally_catch_error
        .catchError((e) {
      if (e.response != null) {
        print(e.response?.data);
        showToast(text: '${e.response.data}', state: ToastStates.WARNING);
        print(e.response?.headers);
        print(e.response?.requestOptions);
        print(e.response?.statusCode);
      } else {
        print(e.message);
      }
    });
  }

  static Future<Response> postData({
    token,
    required String url,
    required Map<String, dynamic> data,
  }) async {
    dio.options.headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    return dio
        .post(
      url,
      data: data,
    )
        .catchError((e) {
      if (e.response != null) {
        print(e.response?.data);
        showToast(text: '${e.response.data}', state: ToastStates.WARNING);
        print(e.response?.headers);
        print(e.response?.requestOptions);
        print(e.response?.statusCode);
      } else {
        print(e.message);
      }
    });
  }

  Future postDataWithAuth(
      {required String url,
      required Map<String, dynamic> data,
      String? token}) async {
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var dio = Dio();
    var response = await dio
        .request(
      '$url',
      data: FormData.fromMap(data),
      options: Options(
        method: 'POST',
        headers: headers,
      ),
    )
        .catchError((e) {
      if (e.response != null) {
        print(e.response?.data);
        showToast(text: '${e.response.data}', state: ToastStates.WARNING);
        print(e.response?.headers);
        print(e.response?.requestOptions);
        print(e.response?.statusCode);
      } else {
        print(e.message);
      }
    });

    if (response.statusCode == 200) {
      return response.data;
    } else {
      return response.statusMessage;
    }
  }

  static Future<Response> putData(
      {required String baseURL,
      Map<String, dynamic>? query,
      required Map<String, dynamic> data,
      String lang = "en",
      String? token}) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token ?? ''
    };
    return dio.put(baseURL, queryParameters: query, data: data);
  }

  Future<Response> deletData(
      {required String path,
      Map<String, dynamic>? query,
      Map<String, dynamic>? body,
      String? token}) async {
    dio.options.headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    return await dio
        .delete(path, data: body)
        // ignore: body_might_complete_normally_catch_error
        .catchError((e) {
      if (e.response != null) {
        print(e.response?.data);
        showToast(text: '${e.response.data}', state: ToastStates.WARNING);
        print(e.response?.headers);
        print(e.response?.requestOptions);
        print(e.response?.statusCode);
      } else {
        print(e.message);
      }
    });
  }
}
