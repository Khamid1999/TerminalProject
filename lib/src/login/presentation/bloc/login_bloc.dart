import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  LoginBloc() : super(LoginInitial()) {
    on<LoginButtonPressedEvent>((event, emit) {
      if (formKey.currentState?.validate() ?? false) {
        emit(
          LoginSuccess(),
        );
      } else {
        emit(
          LoginError(
            error: 'incorrect_form_data'.tr(),
          ),
        );
      }
    });
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
