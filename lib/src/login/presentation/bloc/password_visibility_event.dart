part of 'password_visibility_bloc.dart';

@immutable
abstract class PasswordVisibilityEvent {}
class PasswordVisibilityChangedEvent extends PasswordVisibilityEvent {
  final bool obscurePassword;
  PasswordVisibilityChangedEvent({
    required this.obscurePassword,
  });
}
