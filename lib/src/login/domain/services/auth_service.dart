import 'package:dartz/dartz.dart';
import 'package:terminal_project/src/login/data/models/auth_model.dart';
import 'package:terminal_project/src/login/data/models/error_model.dart';
import 'package:terminal_project/src/login/domain/services/api_helper.dart';

class AuthService {
  Future<Either<Failure, AuthModel>> login(
      String userId, String login, String password) async {
    return await Task<AuthModel>(
      () => ApiClient.instance.login(
        Map<String, dynamic>.from(
          {
            'user_id': userId,
            'login': login,
            'password': password,
          },
        ),
      ),
    )
        .attempt()
        .map(
          (a) => a.leftMap(
            (l) => ErrorMapper.mapError(l),
          ),
        )
        .run();
  }
}
