import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/common/theme/text_style.dart';

///History title to be shown in the history screen at top, changes with the history card.
class HistoryTitle extends StatelessWidget {
  const HistoryTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'اخر سجل طبي لك؟',
      style: TextStyles.onboardingTitle.copyWith(
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
