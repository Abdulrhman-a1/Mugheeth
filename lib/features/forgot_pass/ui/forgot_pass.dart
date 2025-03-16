import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/common/widget/buttons/app_button.dart';
import 'package:graduation/common/widget/custom_shape/welcome_text.dart';
import 'package:graduation/data/auth/service/auth_service.dart';
import 'package:graduation/features/forgot_pass/ui/widgets/forgot_pass_form.dart';
import 'package:graduation/features/forgot_pass/ui/widgets/otp_section.dart';
import 'package:graduation/common/widget/pop_up/error_popup.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ForgotPassScreen extends StatefulWidget {
  const ForgotPassScreen({super.key});

  @override
  State<ForgotPassScreen> createState() => _ForgotPassScreenState();
}

class _ForgotPassScreenState extends State<ForgotPassScreen> {
  final AuthService authService = AuthService();
  final TextEditingController emailController = TextEditingController();
  bool isButtonClicked = false;
  bool isLoading = false;

  Future<void> _sendResetPasswordEmail() async {
    final loc = AppLocalizations.of(context)!;

    if (emailController.text.isEmpty) {
      showToastMessage(
        context,
        loc.email_empty,
        "assets/icons/warning.png",
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      await authService.resetPassword(emailController.text);
      showToastMessage(
        context,
        'تم إرسال رابط إعادة تعيين كلمة المرور إلى البريد الإلكتروني',
        "assets/icons/success.png",
      );
      setState(() {
        isButtonClicked = true;
      });
    } catch (e) {
      showToastMessage(
        context,
        'حدث خطأ أثناء إرسال البريد الإلكتروني. حاول مرة أخرى',
        "assets/icons/warning.png",
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Container(
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
              imgPath: isButtonClicked
                  ? "assets/icons/forgotpass.png"
                  : "assets/icons/conversation.png",
              desc: isButtonClicked ? loc.opt_recived : loc.opt_title,
            ),
            isButtonClicked
                ? const OtpSection()
                : ForgotPassForm(controller: emailController),
            if (isLoading)
              const CircularProgressIndicator()
            else
              AppButton(
                text: isButtonClicked ? loc.feedback_submit : loc.opt_button,
                press: _sendResetPasswordEmail,
              ),
            SizedBox(height: 20.sp),
          ],
        ),
      ),
    );
  }
}
