import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/common/widget/buttons/app_button.dart';
import 'package:graduation/common/widget/custom_shape/welcome_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:graduation/common/widget/fields/app_textfield.dart';
import 'package:graduation/data/auth/bloc/auth_bloc.dart';
import 'package:graduation/data/auth/bloc/auth_event.dart';
import 'package:graduation/data/auth/bloc/auth_state.dart';
import 'package:graduation/common/widget/pop_up/error_popup.dart';
import 'package:iconsax/iconsax.dart';
import '../../../common/widget/loader/progress.dart';

class ResetPasswordScreen extends StatefulWidget {
  final String oobCode;

  const ResetPasswordScreen({super.key, required this.oobCode});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => const BouncingLogoLoader(),
          );
        } else if (state is AuthSuccess) {
          if (Navigator.of(context).canPop()) {
            Navigator.of(context).pop(); // إغلاق اللودر إذا كان مفتوحًا
          }
          if (Navigator.of(context).canPop()) {
            Navigator.of(context)
                .pop(); // إغلاق الـ BottomSheet إذا كان مفتوحًا
          }
          showToastMessage(
            context,
            "✅ تم تحديث كلمة المرور بنجاح!",
            isError: false,
            "assets/icons/success.png",
          );
        } else if (state is AuthFailure) {
          if (Navigator.of(context).canPop()) {
            Navigator.of(context).pop(); // إغلاق اللودر إذا كان مفتوحًا
          }
          showToastMessage(
            context,
            state.message,
            isError: true,
            "assets/icons/warning.png",
          );
        }
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5.sp),
            topRight: Radius.circular(5.sp),
          ),
        ),
        padding: EdgeInsets.all(30.0.sp),
        child: SingleChildScrollView(
          child: Column(
            children: [
              WelcomeText(
                imgPath: "assets/icons/resend.png",
                desc: loc.enter_new_password,
              ),
              SizedBox(height: 20.sp),
              AppTextFormField(
                controller: passwordController,
                isObscureText: true,
                suffixIcon: const Icon(Iconsax.password_check),
                hintText: loc.password,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return loc.pass_empty;
                  }
                  return null;
                },
              ),
              SizedBox(height: 10.sp),
              AppTextFormField(
                controller: confirmPasswordController,
                isObscureText: true,
                suffixIcon: const Icon(Iconsax.password_check),
                hintText: loc.password_confirom,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return loc.pass_empty;
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.sp),
              AppButton(
                text: loc.reset_password,
                press: () {
                  if (passwordController.text !=
                      confirmPasswordController.text) {
                    showToastMessage(
                      context,
                      loc.unmatch_pass,
                      isError: true,
                      "assets/icons/warning.png",
                    );
                    return;
                  }
                  context.read<AuthBloc>().add(AuthConfirmResetPassword(
                        oobCode: widget.oobCode,
                        newPassword: passwordController.text,
                      ));
                },
              ),
              SizedBox(height: 20.sp),
            ],
          ),
        ),
      ),
    );
  }
}
