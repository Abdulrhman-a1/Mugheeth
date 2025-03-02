import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/common/theme/colors.dart';

class AppSiderbar extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;

  const AppSiderbar({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(overlayColor: Colors.transparent),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            textAlign: TextAlign.right,
            style: TextStyle(
              color: AppColors.mainAppColor,
              fontSize: 16.sp,
            ),
          ),
          Icon(
            icon,
            color: AppColors.mainAppColor.withOpacity(0.8),
            size: 20.sp,
          ),
        ],
      ),
    );
  }
}
