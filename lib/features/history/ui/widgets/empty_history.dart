import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/common/theme/colors.dart';
import 'package:graduation/common/widget/animation/message_animation.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EmptyHistory extends StatelessWidget {
  const EmptyHistory({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Column(
      children: [
        Lottie.asset(
          "assets/lottie/r.json",
          width: 200.w,
          height: 200.h,
        ),
        SizedBox(height: 20.0.sp),
        AnimatedText(
          text: loc.empty_history,
          textstyle: TextStyle(
            fontSize: 14.0.sp,
            color: AppColors.mainAppColor,
          ),
        ),
      ],
    );
  }
}
