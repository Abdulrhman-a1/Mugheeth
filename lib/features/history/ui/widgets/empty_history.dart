import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/common/helper/extensions.dart';
import 'package:graduation/common/widget/buttons/app_button.dart';
import 'package:lottie/lottie.dart';

class EmptyHistory extends StatelessWidget {
  const EmptyHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Lottie.asset(
          "assets/lottie/r.json",
          width: 200.w,
          height: 200.h,
        ),
        SizedBox(height: 40.h),
        SizedBox(
          width: 200.w,
          child: AppButton(
            text: "ابدا الان",
            press: () {
              context.pop();
            },
          ),
        ),
      ],
    );
  }
}
