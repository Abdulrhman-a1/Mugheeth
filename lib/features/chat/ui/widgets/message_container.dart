import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/common/theme/colors.dart';
import 'package:graduation/common/widget/loader/chat_loader.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MessageContainer extends StatelessWidget {
  const MessageContainer({
    super.key,
    required this.content,
    required this.index,
    required this.isUser,
    this.isLoading = false,
  });

  final int index;
  final String content;
  final bool isUser;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final isRtl = loc.localeName == "ar";

    if (isLoading) {
      return Align(
        alignment: isRtl ? Alignment.centerLeft : Alignment.centerRight,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.0.sp,
            vertical: 8.0.sp,
          ),
          child: ChatLoader(),
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0.sp, vertical: 4.0.sp),
      child: IntrinsicWidth(
        child: Align(
          alignment: isUser
              ? (isRtl ? Alignment.centerLeft : Alignment.centerRight)
              : (isRtl ? Alignment.centerRight : Alignment.centerLeft),
          child: Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.75,
            ),
            margin: EdgeInsets.symmetric(
              vertical: 4.h,
              horizontal: 8.w,
            ),
            padding: EdgeInsets.all(12.sp),
            decoration: BoxDecoration(
              color: isUser
                  ? AppColors.mainSoftBlue.withOpacity(0.2)
                  : AppColors.mainAppColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12.sp),
            ),
            child: Text(
              content,
              style: TextStyle(
                fontSize: 14.sp,
                color: isUser ? AppColors.mainAppColor : Colors.black87,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
