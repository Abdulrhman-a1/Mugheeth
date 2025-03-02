import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/common/theme/text_style.dart';

class AppContainer extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final double raduis;
  final Color color;
  final Color textColor;

  const AppContainer({
    super.key,
    required this.label,
    required this.onPressed,
    required this.raduis,
    required this.color,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        overlayColor: Colors.transparent,
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(raduis.sp),
        ),
      ),
      child: Text(
        label,
        style: TextStyles.chatAppBarName.copyWith(
          color: textColor,
        ),
      ),
    );
  }
}
