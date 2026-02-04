import 'package:dio/dio.dart';
import 'package:flutter_donation/resource/local/local_secure_storage.dart';
// import 'package:flutter_donation/resource/local/local_secure_storage.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, handler) async {
    final token = await LocalSecureStorage.getToken();
    options.headers['Accept'] = 'application/json';
    options.headers['Content-Type'] = 'application/json';
    if (token != null) {
      options.headers["Authorization"] = 'Bearer $token';
    }
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, handler) async {
    if (err.response?.statusCode == 401) {
      await LocalSecureStorage.deleteToken();
    }
    super.onError(err, handler);
  }
}
