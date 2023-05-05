import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:side_effect_bloc/side_effect_bloc.dart';
import 'package:splyshechka/di/locator.dart';
import 'package:splyshechka/navigation/auto_router.gr.dart';
import 'package:splyshechka/pages/login/password_retrieval/bloc/password_retrieval_bloc.dart';
import 'package:splyshechka/pages/login/widgets/login_text_field.dart';
import 'package:splyshechka/utils/app_colors.dart';
import 'package:splyshechka/utils/app_text_styles.dart';
import 'package:splyshechka/utils/validation.dart';
import 'package:splyshechka/widgets/buttons/large_button.dart';
import 'package:splyshechka/widgets/buttons/small_button.dart';

class PasswordRetrievalPage extends StatefulWidget {
  const PasswordRetrievalPage({Key? key}) : super(key: key);

  @override
  State<PasswordRetrievalPage> createState() => _PasswordRetrievalPageState();
}

class _PasswordRetrievalPageState extends State<PasswordRetrievalPage> {
  bool clicked = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<PasswordRetrievalBloc>(),
      child: BlocSideEffectConsumer<
          PasswordRetrievalBloc,
          PasswordRetrievalBloc,
          PasswordRetrievalState,
          PasswordRetrievalCommand>(
        listener: (context, sideEffect) {
          sideEffect.when(
            navToLogin: () {
              const snackBar = SnackBar(
                content: Text('Пароль успешно изменён!'),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
              context.navigateTo(const LoginRoute());
            },
            error: () {
              const snackBar = SnackBar(
                content: Text('Ошибка! Неверный данные.'),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
          );
        },
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            title: const Text("Восстановление пароля"),
          ),
          body: Form(
            key: _formKey,
            child: SafeArea(
              child: Container(
                padding: EdgeInsets.only(
                  right: 35.w,
                  left: 35.w,
                  bottom: 16.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 16.w,
                        top: 6.h,
                        bottom: 8.h,
                      ),
                      child: Text(
                        "Email",
                        style: AppTextStyles.profileLabelStyle,
                      ),
                    ),
                    RegistrationTextField(
                        controller: _emailController,
                        validator: Validation.emailValidation,
                        hintText: "Введите email"),
                    SizedBox(height: 10.h),
                    if (clicked) ...[
                      RegistrationTextField(
                          controller: _codeController,
                          validator: Validation.codeValidation,
                          hintText: "Введите код с почты"),
                      SizedBox(height: 10.h),
                    ],
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 15.h,
                        top: 5.h,
                      ),
                      child: SmallButton(
                        text: "Отправить код",
                        textColor: const Color.fromRGBO(83, 83, 177, 1),
                        textSize: 16.sp,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              clicked = !clicked;
                            });
                            context.read<PasswordRetrievalBloc>().add(
                                PasswordRetrievalEvent.sendCode(
                                    email: _emailController.text));
                          }
                        },
                      ),
                    ),
                    RegistrationTextField(
                        controller: _passwordController,
                        validator: Validation.passwordValidation,
                        hintText: "Введите новый пароль"),
                    const Spacer(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 7.w),
                      child: GestureDetector(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            context
                                .read<PasswordRetrievalBloc>()
                                .add(PasswordRetrievalEvent.resetPassword(
                                  code: _codeController.text,
                                  newPassword: _passwordController.text,
                                ));
                          }
                        },
                        child: Container(
                          height: 45.h,
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
                              "Сохранить",
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
                    ),
                    SizedBox(height: 6.h),
                    LargeButton(
                      text: "Отмена",
                      onPressed: () {
                        context.navigateBack();
                      },
                    ),
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
