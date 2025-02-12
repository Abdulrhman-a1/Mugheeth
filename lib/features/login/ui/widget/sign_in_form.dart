import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/common/widget/buttons/app_button.dart';
import 'package:graduation/common/widget/custom_shape/welcome_text.dart';
import 'package:graduation/common/widget/fields/app_textfield.dart';
import 'package:graduation/features/login/ui/widget/forgot_pass.dart';
import 'package:iconsax/iconsax.dart';

///Form where the user will be able to sign in.
class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const WelcomeText(title: "اهلًا بك", desc: "سجل دخولك للمتابعة"),
        AppTextFormField(
          suffixIcon: const Icon(Iconsax.send_1),
          hintText: "البريد الالكتروني",
          validator: (value) {
            if (value!.isEmpty) {
              return 'الرجاء ادخال البريد الالكتروني';
            }
            return null;
          },
        ),
        SizedBox(height: 20.h),
        AppTextFormField(
          suffixIcon: const Icon(Iconsax.password_check),
          hintText: "كلمة المرور",
          isObscureText: true,
          validator: (value) {
            if (value!.isEmpty) {
              return 'الرجاء ادخال كلمة المرور';
            }
            return null;
          },
        ),
        const ForgotPassButton(),
        SizedBox(height: 10.h),
        AppButton(
          press: () {},
          text: 'تسجيل دخول',
        ),
      ],
    );
  }
}
