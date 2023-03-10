abstract class Failure {
  final String message;

  Failure({
    required this.message,
  });
}

class ServerFailure extends Failure {
  final int statusCode;
  ServerFailure({
    required this.statusCode,
    required String message,
  }) : super(
          message: message,
        );
}

class ErrorMapper {
  ErrorMapper._();

  static Failure mapError(dynamic error) {
    return ServerFailure(
      statusCode: 0,
      message: 'Error',
    );
  }
}
