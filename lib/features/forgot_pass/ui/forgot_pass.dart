import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/common/widget/buttons/app_button.dart';
import 'package:graduation/common/widget/custom_shape/welcome_text.dart';
import 'package:graduation/features/forgot_pass/ui/widgets/forgot_pass_form.dart';
import 'package:graduation/features/forgot_pass/ui/widgets/otp_section.dart';

///This will show 2 bottom sheet forms, one for the email and the other for the OTP.
class ForgotPassScreen extends StatefulWidget {
  const ForgotPassScreen({super.key});

  @override
  State<ForgotPassScreen> createState() => _ForgotPassScreenState();
}

class _ForgotPassScreenState extends State<ForgotPassScreen> {
  bool isButtonClicked = false;

  @override
  Widget build(BuildContext context) {
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
              desc: isButtonClicked ? "جاك الرمز؟" : "وش بريدك؟",
            ),
            isButtonClicked ? const OtpSection() : const ForgotPassForm(),
            AppButton(
              text: isButtonClicked ? 'إرسال' : 'إرسال رمز التحقق',
              press: () {
                setState(
                  () {
                    isButtonClicked = !isButtonClicked;
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
