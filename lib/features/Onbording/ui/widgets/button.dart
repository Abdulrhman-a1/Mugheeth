import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/common/theme/colors.dart';

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
        dots(),
        SizedBox(height: 20.h),
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: 60.w,
              height: 60.h,
              child: CircularProgressIndicator(
                value: (currentPage + 1) / totalPage,
                strokeWidth: 2.5.w,
                backgroundColor: AppColors.mainAppColor.withOpacity(0.3),
                valueColor:
                    const AlwaysStoppedAnimation<Color>(AppColors.mainAppColor),
              ),
            ),
            GestureDetector(
              onTap: onNext,
              child: CircleAvatar(
                radius: 25.w,
                backgroundColor: AppColors.mainAppColor,
                child: const Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

//Simple widget to show the current page u r in.
  Widget dots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(totalPage, (index) {
        double width = 8.w;
        if (index == currentPage) {
          width = 16.w;
        }

        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: width,
          height: 8.h,
          margin: EdgeInsets.symmetric(horizontal: 4.w),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.w),
              color: AppColors.mainAppColor
                  .withOpacity(index == currentPage ? 1 : 0.5)),
        );
      }),
    );
  }
}
