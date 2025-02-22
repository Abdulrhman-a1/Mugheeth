import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/common/helper/text.dart';
import 'package:graduation/common/theme/colors.dart';
import 'package:graduation/features/history/ui/widgets/list_cards.dart';

class Dots extends StatelessWidget {
  const Dots({
    super.key,
    required this.widget,
    required int currentPage,
  }) : _currentPage = currentPage;

  final MedicalHistoryCards widget;
  final int _currentPage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        medicalHistoryData.length,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: _currentPage == index ? 16.w : 8.w,
          height: 8.h,
          margin: EdgeInsets.symmetric(horizontal: 4.w),
          decoration: BoxDecoration(
            color: _currentPage == index
                ? AppColors.mainAppColor
                : AppColors.mainAppColor.withOpacity(0.3),
            borderRadius: BorderRadius.circular(4.r),
          ),
        ),
      ),
    );
  }
}
