import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/common/theme/colors.dart';
import 'package:graduation/common/theme/text_style.dart';

///chat button if user logged? will be new chat button, if not will be login button.
class ChatButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const ChatButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0.sp),
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: AppColors.mainAppColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.sp),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyles.loginButtonText,
        ),
      ),
    );
  }
}
