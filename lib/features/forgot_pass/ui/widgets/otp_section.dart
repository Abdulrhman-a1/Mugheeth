import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/common/widget/custom_shape/text_and_icon.dart';
import 'package:graduation/features/forgot_pass/ui/widgets/otp_form.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OtpSection extends StatefulWidget {
  const OtpSection({super.key});

  @override
  OtpSectionState createState() => OtpSectionState();
}

class OtpSectionState extends State<OtpSection> {
  final int _digitCount = 4;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return Column(
      children: [
        OTPform(digitCount: _digitCount),
        SizedBox(height: 20.h),
        FadeInRight(
          delay: const Duration(milliseconds: 500),
          child: TextAndIcon(
            iconPath: "assets/icons/resend.png",
            label: loc.opt_code,
            description: loc.otp_resend,
            onPressed: () {},
          ),
        ),
        SizedBox(height: 40.h),
      ],
    );
  }
}
