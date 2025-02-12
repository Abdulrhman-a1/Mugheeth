import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/common/widget/custom_shape/text_and_icon.dart';
import 'package:graduation/features/forgot_pass/ui/widgets/otp_form.dart';

class OtpSection extends StatefulWidget {
  const OtpSection({super.key});

  @override
  OtpSectionState createState() => OtpSectionState();
}

class OtpSectionState extends State<OtpSection> {
  final int _digitCount = 4;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OTPform(digitCount: _digitCount),
        SizedBox(height: 20.h),
        FadeInRight(
          delay: const Duration(milliseconds: 500),
          child: TextAndIcon(
            iconPath: "assets/icons/resend.png",
            label: "رمز التحقق",
            description: "ارسل رمز التحقق مرة ثانية",
            onPressed: () {},
          ),
        ),
        SizedBox(height: 40.h),
      ],
    );
  }
}
