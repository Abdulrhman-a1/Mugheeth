import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/common/theme/colors.dart';

class FloatingPointWidget extends StatefulWidget {
  final String? title;
  final String? imgPath;

  const FloatingPointWidget({
    super.key,
    this.title,
    this.imgPath,
  });

  @override
  FloatingPointWidgetState createState() => FloatingPointWidgetState();
}

class FloatingPointWidgetState extends State<FloatingPointWidget> {
  bool isExpanded = false;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      setState(() {
        isExpanded = !isExpanded;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 50),
        curve: Curves.easeInOut,
        padding: EdgeInsets.symmetric(
          horizontal: isExpanded ? 12.w : 10.w,
          vertical: 10.h,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50.h),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isExpanded)
              Padding(
                padding: EdgeInsets.only(left: 8.w),
                child: Text(
                  widget.title ?? "تحتاج مساعدة؟",
                  style: TextStyle(
                    color: AppColors.mainAppColor,
                    fontSize: 12.sp,
                  ),
                ),
              ),
            CircleAvatar(
              radius: 12,
              backgroundColor: AppColors.mainSoftBlue.withOpacity(0.55),
              child: Image.asset(
                widget.imgPath ?? "assets/icons/question.png",
                width: 12.w,
                height: 12.h,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
