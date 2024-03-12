import 'dart:html';

import 'package:dio/dio.dart';

class SessionManager {
 static final SessionManager _instance = SessionManager._internal();
 late Dio _dio;
 late String _token;

 factory SessionManager() {
    return _instance;
 }

 SessionManager._internal() {
    _dio = Dio();
    _setupInterceptors();
 }

 void setToken(String token) {
    _token = token;
      window.localStorage['token'] = token;
    _updateAuthorizationHeader();
 }

 void _updateAuthorizationHeader() {
    _dio.options.headers['Authorization'] = 'Bearer $_token';
 }

 void _setupInterceptors() {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        _updateAuthorizationHeader();
        return handler.next(options);
      },
      onError: (e, handler) {
        // Handle error interceptors
        return handler.next(e);
      },
    ));
 }

 Future<Response> get(String url) async {
    return await _dio.get(url);
 }

 Future<Response> post(String url, {dynamic data}) async {
    return await _dio.post(url, data: data);
 }

 // Add other methods as needed (e.g., put, delete)
}