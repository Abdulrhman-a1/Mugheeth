import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/common/theme/colors.dart';
import 'package:graduation/common/theme/text_style.dart';

class ShowChatButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final TextStyle? textStyle;

  const ShowChatButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: AppColors.mainSoftBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.sp),
          ),
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
        ),
        onPressed: onPressed,
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: AppColors.chatScreenGrey.withOpacity(0.2),
                spreadRadius: 10,
                blurRadius: 20,
                offset: const Offset(0, 3),
              ),
            ],
            shape: BoxShape.circle,
          ),
          child: Text(
            text,
            style: textStyle ??
                TextStyles.loginButtonText.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
      ),
    );
  }
}
