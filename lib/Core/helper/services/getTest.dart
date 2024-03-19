import 'package:dio/dio.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:sales_management_system/Core/Components/components.dart';
import 'package:sales_management_system/Core/helper/shared/shared.dart';
import 'package:sales_management_system/Views/auth/login.dart';
import 'package:sales_management_system/main.dart';

//showTOast: it's like a dialog has a color and text (the text is the
//response message and the colors is ToastStates.SUCCESSFUL of ToastStates.ERROR)
//be sure we have the same components
var dio = Dio();

class DioHelper {
  //init function should invoke in main function before runApp()
  static init() {
    dio = Dio(BaseOptions(
      //this URL is Our API and we will write it here and just here
      //every method in this class has a base url parameter (this API)
      baseUrl: "$zakBasicUrl/",
      receiveDataWhenStatusError: true,
      // connectTimeout: Duration(seconds: 5 ),
      //   receiveTimeout : Duration(seconds: 3)
    ));
  }

  Future<Response> getData({
    required String path,
    Map<String, dynamic>? query,
    Map<String, dynamic>? body,
    String? token,
  }) async {
    if (token != '') {
      dio.options.headers = {
        // 'Cookie': 'laravel_session=${SessionId}',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
//===========================================
      stopTokenRemovalTimer();
      removeTokenAfter(const Duration(minutes: 15));
//===========================================
      return await dio
          .get(path, data: body)
          // ignore: body_might_complete_normally_catch_error
          .catchError((e) {
        if (e.response.statusCode == 401) {
          showToast(
              text: e.response?.data['message'], state: ToastStates.WARNING);
          // Get.off(const LoginScreen());
        } else {
          showToast(
              text: e.response?.data['message'], state: ToastStates.ERROR);
        }
      });
    } else {
      return Response(
        data: 'Unauthorized',
        statusCode: 200,
        requestOptions: RequestOptions(path: ''),
      );
    }
  }

//=================================================================================
  static Future<Response> postData({
    token,
    required String url,
    required Map<String, dynamic> data,
  }) async {
    dio.options.headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
    //===========================================
    stopTokenRemovalTimer();
    removeTokenAfter(const Duration(minutes: 15));
//===========================================
    return dio
        .post(
      url,
      data: data,
    )
        // ignore: body_might_complete_normally_catch_error
        .catchError((e) {
      if (e.response.statusCode == 401) {
        showToast(
            text: e.response?.data['message'], state: ToastStates.WARNING);
        Get.off(const LoginScreen());
      } else {
        showToast(
            text: e.response?.data['message'], state: ToastStates.WARNING);
      }
    });
  }
//=================================================================================

  Future postDataWithAuth(
      {required String url,
      required Map<String, dynamic> data,
      String? token}) async {
    var headers = {
      // 'Cookie': SessionId,
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
    //===========================================
    stopTokenRemovalTimer();
    removeTokenAfter(const Duration(minutes: 15));
//===========================================
    var dio = Dio();
    var response = await dio
        .request(
      url,
      data: FormData.fromMap(data),
      options: Options(
        method: 'POST',
        headers: headers,
      ),
    )
        // ignore: body_might_complete_normally_catch_error
        .catchError((e) {
      if (e.response.statusCode == 401) {
        showToast(
            text: e.response?.data['message'], state: ToastStates.WARNING);
        Get.off(LoginScreen());
      }

      showToast(text: e.response?.data['message'], state: ToastStates.WARNING);
    });

    if (response.statusCode == 200) {
      return response.data;
    } else {}
  }

  static Future<Response> putData(
      {required String baseURL,
      Map<String, dynamic>? query,
      required Map<String, dynamic> data,
      String lang = "en",
      String? token}) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      // 'lang': lang,
      'Authorization': token ?? ''
    };
    //===========================================
    stopTokenRemovalTimer();
    removeTokenAfter(const Duration(minutes: 15));
//===========================================
    return dio.put(baseURL, queryParameters: query, data: data);
  }

  Future<Response> deletData(
      {required String path,
      Map<String, dynamic>? query,
      Map<String, dynamic>? body,
      String? token}) async {
    dio.options.headers = {
      // 'Cookie': SessionId,
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
//===========================================
    stopTokenRemovalTimer();
    removeTokenAfter(const Duration(minutes: 15));
//===========================================
    return await dio
        .delete(path, data: body)
        // ignore: body_might_complete_normally_catch_error
        .catchError((e) {
      if (e.response != null) {
        showToast(text: '${e.response.data}', state: ToastStates.WARNING);
      } else {}
    });
  }
}
