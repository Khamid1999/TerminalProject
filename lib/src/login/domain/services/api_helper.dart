import 'package:retrofit/retrofit.dart';

import 'package:dio/dio.dart';
import 'package:terminal_project/src/history/data/models/history_model.dart';
import 'package:terminal_project/src/login/data/models/auth_model.dart';

part 'api_helper.g.dart';

@RestApi(baseUrl: 'http://ovz1.j74325415.0pjxn.vps.myjino.ru:49428/api/v1')
abstract class ApiClient {
  static final ApiClient instance = _ApiClient(
    Dio()
      ..interceptors.addAll(
        [
          LogInterceptor(
            responseBody: true,
            requestBody: true,
          ),
        ],
      ),
  );

  @POST('/auth')
  Future<AuthModel> login(
    @Body() Map<String, dynamic> body,
  );

  @GET('/history')
  Future<History> getHistory();
}
