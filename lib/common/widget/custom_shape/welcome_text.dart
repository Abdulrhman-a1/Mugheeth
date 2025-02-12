import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/common/theme/colors.dart';
import 'package:graduation/common/theme/text_style.dart';

///This is the design of the welcome text that appears in the signin screens.
class WelcomeText extends StatelessWidget {
  final String? title;
  final String desc;
  final String? imgPath;
  const WelcomeText({super.key, this.title, required this.desc, this.imgPath});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (imgPath != null)
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: AppColors.mainSoftBlue.withOpacity(0.3),
                  blurRadius: 20,
                  spreadRadius: 1,
                  offset: const Offset(0, 0),
                ),
              ],
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              imgPath!,
              width: 35.sp,
              height: 35.sp,
            ),
          ),
        title != null
            ? Text(title!, style: TextStyles.onboardingTitle)
            : SizedBox(height: 10.h),
        Text(
          desc,
          style: TextStyles.onboardingDesc.copyWith(
            color: Colors.black.withOpacity(0.6),
            fontWeight: FontWeight.normal,
            fontSize: 16.sp,
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
