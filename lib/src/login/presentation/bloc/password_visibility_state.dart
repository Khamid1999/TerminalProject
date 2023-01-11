part of 'password_visibility_bloc.dart';

@immutable
abstract class PasswordVisibilityState {
  final bool obscurePassword;

  PasswordVisibilityState(this.obscurePassword);
}
class PasswordVisibilityInitial extends PasswordVisibilityState {
  PasswordVisibilityInitial(bool obscurePassword) : super(obscurePassword);
}
class PasswordVisibilityChangedState extends PasswordVisibilityState {
  final bool obscurePassword;
  PasswordVisibilityChangedState({
    required this.obscurePassword,
  }) : super(true);
}
