import 'package:dio/dio.dart';
import 'package:terminal_project/main.dart';

class TokenInterceptor implements Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    return handler.next(err);
  }

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await localStorage.read(key: 'token');
    options.headers['Authorization'] = 'Bearer $token';
    return handler.next(options);
  }

  @override
  void onResponse(
      Response<dynamic> response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }
}
