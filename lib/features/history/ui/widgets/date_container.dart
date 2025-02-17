import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/common/theme/colors.dart';

class DateContainer extends StatelessWidget {
  const DateContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.sp, horizontal: 16.sp),
        decoration: BoxDecoration(
          color: AppColors.mainSoftBlue.withOpacity(0.3),
          borderRadius: BorderRadius.circular(30.sp),
        ),
        child: Text(
          '١٢ أكتوبر ٢٠٢٣',
          style: TextStyle(
            color: AppColors.mainSoftBlue,
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
