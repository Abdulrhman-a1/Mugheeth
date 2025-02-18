import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/common/widget/buttons/app_button.dart';
import 'package:graduation/common/widget/custom_shape/welcome_text.dart';
import 'package:graduation/common/widget/fields/app_textfield.dart';
import 'package:graduation/common/widget/loader/progress.dart';
import 'package:graduation/features/login/ui/widget/forgot_pass.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widget/pop_up/error_popup.dart';
import '../../../../data/auth/bloc/auth_bloc.dart';

/// Form where the user will be able to sign in.
class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  SignInFormState createState() => SignInFormState();
}

class SignInFormState extends State<SignInForm> {
  // إضافة الـ Controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          // إظهار الـ Loader
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return const BouncingLogoLoader();
            },
          );
        } else if (state is AuthFailure) {
          // إظهار رسالة الخطأ
          errorPopUp(context, state.message);
        } else if (state is AuthSuccess) {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
          // إظهار رسالة النجاح
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('تم تسجيل الدخول بنجاح'),
              backgroundColor: Colors.green,
            ),
          );
        }
      },
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const WelcomeText(title: "اهلًا بك", desc: "سجل دخولك للمتابعة"),

              // حقل البريد الإلكتروني
              AppTextFormField(
                controller: emailController, // تم إضافة الـ Controller هنا
                isEmailAndPassword: true,
                suffixIcon: const Icon(Iconsax.send_1),
                hintText: "البريد الإلكتروني",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'الرجاء إدخال البريد الإلكتروني';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.h),

              // حقل كلمة المرور
              AppTextFormField(
                controller: passwordController, // تم إضافة الـ Controller هنا
                isEmailAndPassword: true,
                suffixIcon: const Icon(Iconsax.password_check),
                hintText: "كلمة المرور",
                isObscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'الرجاء إدخال كلمة المرور';
                  }
                  return null;
                },
              ),

              const ForgotPassButton(),
              SizedBox(height: 10.h),

              // زر تسجيل الدخول
              AppButton(
                press: () {
                  if (_formKey.currentState!.validate()) {
                    // إرسال بيانات تسجيل الدخول إلى AuthBloc
                    context.read<AuthBloc>().add(
                          AuthSignIn(
                            email: emailController.text,
                            password: passwordController.text,
                          ),
                        );
                  }
                },
                text: 'تسجيل دخول',
              ),
            ],
          ),
        );
      },
    );
  }
}
