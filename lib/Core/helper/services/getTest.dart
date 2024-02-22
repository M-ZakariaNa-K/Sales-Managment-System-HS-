// ignore: file_names
import 'package:dio/dio.dart';
import 'package:sales_management_system/Core/Components/components.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: 'http://127.0.0.1:8000/api/',
      receiveDataWhenStatusError: true,
      // connectTimeout: Duration(seconds: 5 ),
      //   receiveTimeout : Duration(seconds: 3)
    ));
  }

  static Future<Response> getData(
      {required String path,
      Map<String, dynamic>? query,
      String? token}) async {
    dio.options.headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    return await dio
        .get(
      path,
      queryParameters: query,
    )
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
    required String url,
    required Map<String, dynamic> data,
  }) async {
    dio.options.headers = {
      'Accept': 'application/json',
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

  static Future postDataWithAuth(
      {required String url,
      required Map<String, String> data,
      String? token}) async {
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var dio = Dio();
    var response = await dio
        .request(
      'http://10.0.2.2:8000/api/$url',
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
      {required String url,
      Map<String, dynamic>? query,
      required Map<String, dynamic> data,
      String lang = "en",
      String? token}) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token ?? ''
    };
    return dio.put(url, queryParameters: query, data: data);
  }
}
