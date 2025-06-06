import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/common/theme/colors.dart';

class TextStyles {
  //Text in onboarding screen; Title.
  static TextStyle onboardingTitle = TextStyle(
    fontSize: 22.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.mainAppColor,
  );

  //Text in onboarding screen; Description.
  static TextStyle onboardingDesc = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.mainSoftBlue,
  );

  //Text in chat screen; appBar.
  static TextStyle chatAppBarName = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.mainSoftBlue,
  );

  //login button text style.
  static TextStyle loginButtonText = TextStyle(
    fontSize: 11.sp,
    fontWeight: FontWeight.normal,
    color: Colors.white,
  );

  //Text in recording screen; recording text.
  static TextStyle recording = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.mainAppColor,
    decoration: TextDecoration.none,
  );

  //Text in recording screen; recording text.
  static TextStyle mugheethServices = TextStyle(
    fontSize: 22.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.mainSoftBlue,
    decoration: TextDecoration.none,
  );

  //Time in chat
  static TextStyle timeText = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.mainSoftBlue,
    decoration: TextDecoration.none,
  );

  //Time in chat
  static TextStyle hintTextLogin = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.normal,
    color: AppColors.mainSoftBlue,
    decoration: TextDecoration.none,
  );
}
