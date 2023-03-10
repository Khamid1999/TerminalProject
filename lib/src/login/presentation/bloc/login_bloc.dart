import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:terminal_project/src/login/domain/services/auth_service.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  AuthService authService = AuthService();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  LoginBloc() : super(LoginInitial()) {
    on<LoginButtonPressedEvent>(
      (event, emit) async {
        if (formKey.currentState!.validate()) {
          await authService
              .login(
            event.userId,
            event.login,
            event.password,
          )
              .then(
            (value) {
              value.fold(
                (l) => emit(
                  LoginError(
                    error: l.message,
                  ),
                ),
                (r) {
                  if (r.login == true) {
                    emit(
                      LoginSuccess(),
                    );
                  } else {
                    emit(
                      LoginError(
                        error: 'Неверный логин или пароль',
                      ),
                    );
                  }
                },
              );
            },
          );
        }
      },
    );
  }
}
