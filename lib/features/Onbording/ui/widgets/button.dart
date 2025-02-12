import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/common/theme/colors.dart';
import 'package:graduation/common/theme/text_style.dart';

///Button to controls the navigation in the onboarding screens
class OnboardingIndicator extends StatelessWidget {
  final int currentPage;
  final int totalPage;
  final VoidCallback onNext;

  const OnboardingIndicator({
    super.key,
    required this.currentPage,
    required this.totalPage,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildDots(),
        SizedBox(height: 20.h),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.06,
          child: TextButton(
            onPressed: onNext,
            style: TextButton.styleFrom(
              overlayColor: Colors.transparent,
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.sp),
                side: BorderSide(color: AppColors.mainAppColor, width: 1.5.sp),
              ),
            ),
            child: Text(
              "التالي",
              style: TextStyles.onboardingDesc.copyWith(
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
      ],
    );
  }

  //Method to build the dots that represent the pages
  Widget buildDots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        totalPage,
        (index) {
          return Container(
            width: 7.w,
            height: 8.h,
            margin: EdgeInsets.symmetric(horizontal: 4.0.sp),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: index == currentPage
                  ? AppColors.mainAppColor
                  : AppColors.mainAppColor.withOpacity(0.5),
            ),
          );
        },
      ),
    );
  }
}
