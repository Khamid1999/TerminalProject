part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class LoginButtonPressedEvent extends LoginEvent {
  final String userId;
  final String login;
  final String password;

  LoginButtonPressedEvent({
    required this.userId,
    required this.login,
    required this.password,
  });
}
