import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/common/theme/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RecordingText extends StatelessWidget {
  const RecordingText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Padding(
      padding: EdgeInsets.only(top: 90.h),
      child: Text(
        loc.recording_title,
        style: TextStyle(
          fontSize: 24.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.mainAppColor,
        ),
      ),
    );
  }
}
