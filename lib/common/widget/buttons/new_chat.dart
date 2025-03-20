import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/common/routing/extensions.dart';
import 'package:graduation/common/theme/colors.dart';
import 'package:graduation/common/theme/text_style.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NewChatButton extends StatelessWidget {
  final VoidCallback onNewChat;

  const NewChatButton({
    super.key,
    required this.onNewChat,
  });

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      height: MediaQuery.of(context).size.height * 0.06,
      child: TextButton(
        style: TextButton.styleFrom(
          overlayColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.sp),
            side: BorderSide(color: AppColors.mainAppColor, width: 1.5.sp),
          ),
        ),
        onPressed: () {
          onNewChat();
          context.pop();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: AppColors.mainSoftBlue.withOpacity(0.3),
                    blurRadius: 22,
                    spreadRadius: 4,
                    offset: const Offset(0, 0),
                  ),
                ],
                shape: BoxShape.circle,
              ),
              child: Icon(
                Iconsax.add,
                color: AppColors.mainAppColor,
                size: 20.sp,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              loc.newchat,
              style: TextStyles.onboardingDesc.copyWith(
                fontWeight: FontWeight.normal,
                fontSize: 15.sp,
                color: AppColors.mainAppColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
