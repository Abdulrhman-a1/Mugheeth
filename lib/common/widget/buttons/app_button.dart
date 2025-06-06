import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/common/theme/colors.dart';
import 'package:graduation/common/theme/text_style.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

///A button that is used in the app. LOGIN, SIGNUP, and others.
class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? press;
  final bool isShadowNeeded;
  const AppButton({
    super.key,
    required this.text,
    this.press,
    this.isShadowNeeded = false,
  });

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return Container(
      decoration: BoxDecoration(
        boxShadow: isShadowNeeded
            ? [
                BoxShadow(
                  color: AppColors.mainAppColor.withOpacity(0.5),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ]
            : null,
      ),
      child: CupertinoButton(
        padding: const EdgeInsets.all(20),
        color: AppColors.mainAppColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        onPressed: press,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyles.loginButtonText.copyWith(
                fontSize: 18.sp,
                fontFamily:
                    loc.localeName == 'ar' ? 'IBMPlexSansArabic' : 'Share',
              ),
            ),
            const SizedBox(width: 4),
            const Icon(
              Icons.arrow_forward_rounded,
              size: 20,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
