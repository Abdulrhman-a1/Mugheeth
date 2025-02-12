import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/common/theme/text_style.dart';

///This will be used in all on boarding section to show the title and description.
class TitleAndDescription extends StatelessWidget {
  const TitleAndDescription({
    super.key,
    required this.child,
    required this.title,
    required this.description,
  });

  final Widget child;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: child),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.sp),
          child: Column(
            children: [
              Text(
                title,
                //I have created a text style class to have the common text styles.
                style: TextStyles.onboardingTitle,
              ),
              SizedBox(height: 16.h),
              Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyles.onboardingDesc,
              ),
              SizedBox(height: 48.h),
            ],
          ),
        ),
      ],
    );
  }
}
