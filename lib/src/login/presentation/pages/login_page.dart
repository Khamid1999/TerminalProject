import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:terminal_project/src/login/presentation/bloc/login_bloc.dart';
import 'package:terminal_project/src/login/presentation/bloc/password_visibility_bloc.dart';
import 'package:terminal_project/src/login/presentation/widgets/custom_text_field.dart';
import 'package:terminal_project/src/login/presentation/widgets/white_bottom_container.dart';
import 'package:terminal_project/src/router/app_routes.dart';
import 'package:terminal_project/src/theme/app_colors.dart';
import 'package:terminal_project/src/theme/app_spacings.dart';
import 'package:terminal_project/src/theme/app_styles.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final bloc = BlocProvider.of<LoginBloc>(context);
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            !isKeyboard ?
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(55),
              ),
              elevation: 10,
              color: AppColors.white,
              child: Container(
                width: size.width,
                height: isKeyboard ? size.height * 0.3 : size.height * 0.4,
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: AppColors.grey,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(55),
                    bottomRight: Radius.circular(55),
                  ),
                ),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        AppSpacings.vert24,
                        Image.asset(
                          "assets/images/crypto_logo_without_background.png",
                          width: constraints.maxWidth * 0.5,
                          height: constraints.maxHeight * 0.5,
                          color: AppColors.white,
                        ),
                        AppSpacings.vert12,
                        Text(
                          'provide_login_info'.tr(),
                          style: AppStyles.mainWhiteTextStyle,
                          textAlign: TextAlign.center,
                        ),
                        AppSpacings.vert12,
                      ],
                    );
                  },
                ),
              ),
            ) : Container(),
            Container(
              width: size.width,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Form(
                key: bloc.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'email'.tr(),
                      style: AppStyles.mainBlackTextStyle,
                    ),
                    AppSpacings.vert12,
                    CustomTextField(
                      validator: (value) {
                        if (value?.isEmpty ?? false) {
                          return 'empty_value_error'.tr();
                        } else {
                          return null;
                        }
                      },
                      textInputAction: TextInputAction.next,
                      hintText: 'enter_your_email'.tr(),
                      controller: bloc.emailController,
                    ),
                    AppSpacings.vert20,
                    Text(
                      'password'.tr(),
                      style: AppStyles.mainBlackTextStyle,
                    ),
                    AppSpacings.vert12,
                    BlocBuilder<PasswordVisibilityBloc,
                        PasswordVisibilityState>(
                      bloc: context.read<PasswordVisibilityBloc>(),
                      builder: (context, state) {
                        return CustomTextField(
                          validator: (value) {
                            if (value?.isEmpty ?? false) {
                              return 'empty_value_error'.tr();
                            } else if (value!.length  < 6) {
                              return 'password_length_error'.tr();
                            } else {
                              return null;
                            }
                          },
                          obscureText: state.obscurePassword,
                          hintText: 'enter_your_email'.tr(),
                          suffixIcon: Icon(
                            state.obscurePassword
                                ? CupertinoIcons.eye_slash
                                : CupertinoIcons.eye,
                            color: AppColors.black,
                            size: 25,
                          ),
                          suffixIconOnTap: () {
                            context.read<PasswordVisibilityBloc>().add(
                                  PasswordVisibilityChangedEvent(
                                    obscurePassword: state.obscurePassword,
                                  ),
                                );
                          },
                          controller: bloc.passwordController,
                          textInputAction: TextInputAction.go,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: !isKeyboard
          ? BlocConsumer<LoginBloc, LoginState>(
              bloc: bloc,
              listener: (context, state) {
                if (state is LoginSuccess) {
                  Navigator.of(context).pushReplacementNamed(
                    AppRoutes.rootPage,
                  );
                }
              },
              builder: (context, state) {
                if (state is LoginLoading) {
                  return BottomWhiteContainer(
                    height: 100,
                    width: size.width,
                    child: Center(
                      child: CircularProgressIndicator(
                        color: AppColors.black,
                      ),
                    ),
                  );
                }
                if (state is! LoginLoading) {
                  return Container(
                    width: size.width,
                    height: size.height * 0.13,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          AppColors.grey,
                        ),
                      ),
                      onPressed: () {
                        bloc.add(
                          LoginButtonPressedEvent(
                            email: bloc.emailController.text,
                            password: bloc.passwordController.text,
                          ),
                        );
                      },
                      child: Text(
                        'login'.tr(),
                        style: AppStyles.mainWhiteTextStyle,
                      ),
                    ),
                  );
                }
                return Container();
              },
            )
          : null,
    );
  }
}
