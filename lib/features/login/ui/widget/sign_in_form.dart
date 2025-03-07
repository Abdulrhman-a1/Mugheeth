import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/common/widget/buttons/app_button.dart';
import 'package:graduation/common/widget/custom_shape/welcome_text.dart';
import 'package:graduation/common/widget/fields/app_textfield.dart';
import 'package:graduation/common/widget/loader/progress.dart';
import 'package:graduation/data/auth/bloc/auth_event.dart';
import 'package:graduation/data/auth/bloc/auth_state.dart';
import 'package:graduation/features/login/ui/widget/forgot_pass.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../common/widget/pop_up/error_popup.dart';
import '../../../../data/auth/bloc/auth_bloc.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  SignInFormState createState() => SignInFormState();
}

class SignInFormState extends State<SignInForm> {
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
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => const BouncingLogoLoader(),
          );
        } else if (state is AuthFailure) {
          Navigator.of(context).pop();
          showToastMessage(context, state.message, "assets/icons/warning.png");
        } else if (state is AuthSuccess) {
          Navigator.of(context).pushNamedAndRemoveUntil(
              '/chat', (Route<dynamic> route) => false);
          showToastMessage(
              context,
              "تم تسجيل الدخول بنجاح",
              isError: false,
              "assets/icons/check.png");
        }
      },
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const WelcomeText(title: "اهلًا بك", desc: "سجل دخولك للمتابعة"),
              AppTextFormField(
                controller: emailController,
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
              AppTextFormField(
                controller: passwordController,
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
              AppButton(
                press: () {
                  if (_formKey.currentState!.validate()) {
                    context.read<AuthBloc>().add(
                          AuthSignIn(
                            email: emailController.text.toLowerCase(),
                            password: passwordController.text.trim(),
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
