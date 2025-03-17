import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation/common/widget/animation/animation_bottom_sheet.dart';
import 'package:graduation/common/widget/buttons/app_button.dart';
import 'package:graduation/common/widget/custom_shape/welcome_text.dart';
import 'package:graduation/features/forgot_pass/ui/ResetPass.dart'
    show ResetPasswordScreen;
import 'package:graduation/features/forgot_pass/ui/widgets/forgot_pass_form.dart';
import 'package:graduation/common/widget/pop_up/error_popup.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:graduation/data/auth/bloc/auth_bloc.dart';
import 'package:graduation/data/auth/bloc/auth_state.dart';

import '../../../common/widget/loader/progress.dart';
import '../../../data/auth/bloc/auth_event.dart';

class ForgotPassScreen extends StatefulWidget {
  const ForgotPassScreen({super.key});

  @override
  State<ForgotPassScreen> createState() => _ForgotPassScreenState();
}

class _ForgotPassScreenState extends State<ForgotPassScreen> {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthResendSuccess) {
          Navigator.pop(context); // Close the popup
          Navigator.pop(context); // إغلاق اللودينج
          Navigator.pop(context); //
          showToastMessage(
            context,
            loc.password_reset_link_sent,
            isError: false,
            "assets/icons/success.png",
          );
        } else if (state is AuthLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => const BouncingLogoLoader(),
          );
        } else if (state is AuthFailure) {
          Navigator.pop(context); // Close the popup

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
                imgPath: "assets/icons/forgotpass.png",
                desc: loc.forgot_password_desc,
              ),
              ForgotPassForm(controller: emailController),
              AppButton(
                text: loc.send_reset_link,
                press: () {
                  context
                      .read<AuthBloc>()
                      .add(AuthResetPassword(email: emailController.text));
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
