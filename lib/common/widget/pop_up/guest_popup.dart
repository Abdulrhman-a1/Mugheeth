import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/common/theme/colors.dart';
import 'package:graduation/common/widget/animation/message_animation.dart';
import 'package:graduation/common/widget/custom_shape/text_and_icon.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GuestPopup extends StatelessWidget {
  const GuestPopup({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(bottom: 30.0.sp),
        child: Column(
          children: [
            TextAndIcon(
              iconPath: "assets/icons/security.png",
              label: loc.service_not_allowed,
              description: loc.service_not_allowed_desc,
              onPressed: () {},
            ),
            SizedBox(height: 20.0.sp),
            Opacity(
              opacity: 0.5,
              child: Lottie.asset(
                "assets/lottie/denied.json",
                width: 200.0.sp,
                height: 200.0.sp,
              ),
            ),
            SizedBox(height: 20.0.sp),
            AnimatedText(
              text: loc.service_not_allowed_button,
              textstyle: TextStyle(
                fontSize: 14.0.sp,
                color: AppColors.mainAppColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
