import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/common/theme/colors.dart';
import 'package:graduation/common/widget/animation/slider_animation.dart';

/// This will design and distinguish [user and ai] the messages in the chat screen
class MessageContainer extends StatelessWidget {
  const MessageContainer({
    super.key,
    required this.messages,
    required this.index,
  });

  final int index;
  final List<String> messages;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0.sp),
      child: IntrinsicWidth(
        child: AnimatedItem(
          index: index,
          child: Container(
            margin: EdgeInsets.symmetric(
              vertical: 8.h,
              horizontal: 8.w,
            ),
            padding: EdgeInsets.all(12.sp),
            decoration: BoxDecoration(
              color: AppColors.mainAppGrey.withOpacity(0.05),
              borderRadius: BorderRadius.circular(12.sp),
            ),
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    messages[index],
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.mainAppColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
