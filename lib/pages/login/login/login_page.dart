import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:side_effect_bloc/side_effect_bloc.dart';
import 'package:splyshechka/di/locator.dart';
import 'package:splyshechka/navigation/auto_router.gr.dart';
import 'package:splyshechka/pages/login/login/bloc/login_bloc.dart';
import 'package:splyshechka/pages/login/widgets/login_text_field.dart';
import 'package:splyshechka/pages/login/widgets/password_text_field.dart';
import 'package:splyshechka/pages/main/main_page.dart';
import 'package:splyshechka/utils/app_colors.dart';
import 'package:splyshechka/utils/app_text_styles.dart';
import 'package:splyshechka/utils/validation.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();

    return BlocProvider(
      create: (context) => getIt<LoginBloc>(),
      child: BlocSideEffectConsumer<LoginBloc, LoginBloc, LoginState,
          LoginCommand>(
        listener: (context, sideEffect) {
          sideEffect.when(navToMain: () {
            context.navigateTo(const MainRoute());
          }, error: () {
            const snackBar = SnackBar(
              content: Text('Ошибка! Неверные данные.'),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          });
        },
        builder: (context, state) => SafeArea(
          child: Scaffold(
            body: Container(
              padding: EdgeInsets.only(bottom: 100.h, left: 50.w, right: 50.w),
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment(0, -0.1),
                      colors: [
                    Color.fromRGBO(83, 83, 177, 1),
                    AppColors.space,
                  ])),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Image.asset(
                        "assets/images/LarkAndOwl.png",
                        fit: BoxFit.contain,
                        width: 200.w,
                        height: 200.h,
                      ),
                    ),
                    Text(
                      "Авторизация",
                      style: TextStyle(
                          fontSize: 26.sp,
                          color: Colors.white,
                          fontFamily: AppTextStyles.fontFamilyOpenSans),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    RegistrationTextField(
                      hintText: 'Email/логин',
                      validator: Validation.loginEnterValidation,
                      controller: _emailController,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    PasswordTextField(
                      hintText: "Пароль",
                      validator: Validation.passwordValidation,
                      controller: _passwordController,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    GestureDetector(
                        child: Text(
                          "Забыли пароль?",
                          style: TextStyle(
                              color: Color.fromRGBO(141, 141, 255, 1),
                              fontFamily: AppTextStyles.fontFamilyOpenSans,
                              fontSize: 14.sp),
                        ),
                        onTap: () {
                          context.navigateTo(PasswordRetrievalRoute());
                        }),
                    SizedBox(
                      height: 40.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          if (Validation.emailValidation(
                                  _emailController.text) ==
                              null) {
                            context.read<LoginBloc>().add(
                                  LoginEvent.signInEmailClicked(
                                    email: _emailController.text,
                                    password: _passwordController.text,
                                  ),
                                );
                          } else {
                            context.read<LoginBloc>().add(
                                  LoginEvent.signInClicked(
                                    email: _emailController.text,
                                    password: _passwordController.text,
                                  ),
                                );
                          }
                        }
                      },
                      child: Container(
                        width: 170.w,
                        height: 35.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(11.r),
                          color: AppColors.greyMain,
                          boxShadow: const [
                            BoxShadow(
                                color: Color.fromRGBO(83, 83, 177, 1),
                                offset: Offset(0, 1))
                          ],
                        ),
                        child: Center(
                          child: Text(
                            "Войти",
                            style: TextStyle(
                              color: AppColors.white,
                              fontFamily: AppTextStyles.fontFamilyOpenSans,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Еще нет аккаунта?",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: AppTextStyles.fontFamilyOpenSans,
                              fontSize: 14.sp),
                        ),
                        SizedBox(
                          width: 5.h,
                        ),
                        GestureDetector(
                          child: Text(
                            "Создать.",
                            style: TextStyle(
                                color: Color.fromRGBO(141, 141, 255, 1),
                                fontFamily: AppTextStyles.fontFamilyOpenSans,
                                fontSize: 14.sp),
                          ),
                          onTap: () =>
                              context.navigateTo(RegistrationRoute()),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
