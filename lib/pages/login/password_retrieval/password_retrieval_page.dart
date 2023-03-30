import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                const RegistrationTextField(validator: Validation.emailValidation,hintText: "Введите email"),
                SizedBox(height: 10.h),
                if (clicked)...[
                  const RegistrationTextField(validator: Validation.codeValidation ,hintText: "Введите код с почты"),
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
                    onPressed: () {setState((){clicked = !clicked;});},
                  ),
                ),
                const RegistrationTextField(validator: Validation.passwordValidation,hintText: "Введите новый пароль"),
                const Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 7.w),
                  child: GestureDetector(
                    onTap: () {if (_formKey.currentState!.validate()) context.navigateBack();},
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
                  onPressed: () {context.navigateBack();},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
