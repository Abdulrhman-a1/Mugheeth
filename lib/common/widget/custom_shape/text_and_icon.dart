import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/common/theme/colors.dart';

class TextAndIcon extends StatelessWidget {
  final String iconPath;
  final String label;
  final String description;
  final Function onPressed;
  final bool isShadowNeeded;

  const TextAndIcon({
    super.key,
    required this.iconPath,
    required this.label,
    required this.description,
    required this.onPressed,
    this.isShadowNeeded = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  boxShadow: isShadowNeeded
                      ? [
                          BoxShadow(
                            color: AppColors.mainSoftBlue.withOpacity(0.5),
                            blurRadius: 10,
                            spreadRadius: 1,
                            offset: const Offset(0, 0),
                          ),
                        ]
                      : null,
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  iconPath,
                  width: 25.w,
                  height: 25.h,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                label,
                style: TextStyle(
                  fontSize: 16.sp,
                  color: AppColors.mainAppColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 4.h),
          Padding(
            padding: EdgeInsets.only(right: 35.w),
            child: Opacity(
              opacity: 0.6,
              child: Text(
                description,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: AppColors.mainAppColor,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
