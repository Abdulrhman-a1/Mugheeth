import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/common/theme/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PasswordValidations extends StatelessWidget {
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasSpecialCharacters;
  final bool hasNumber;
  final bool hasMinLength;
  const PasswordValidations({
    super.key,
    required this.hasLowerCase,
    required this.hasUpperCase,
    required this.hasSpecialCharacters,
    required this.hasNumber,
    required this.hasMinLength,
  });

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return Column(
      children: [
        buildValidationRow(loc.at_least_small, hasLowerCase),
        SizedBox(width: 2.w),
        buildValidationRow(loc.at_least_big, hasUpperCase),
        SizedBox(width: 2.w),
        buildValidationRow(loc.at_least_char, hasSpecialCharacters),
        SizedBox(width: 2.w),
        buildValidationRow(loc.at_least_num, hasNumber),
        SizedBox(width: 2.w),
        buildValidationRow(loc.at_least_eight, hasMinLength),
      ],
    );
  }

  Widget buildValidationRow(String text, bool hasValidated) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 2.5,
          backgroundColor: AppColors.mainAppColor,
        ),
        SizedBox(width: 8.w),
        Text(
          text,
          style: TextStyle(
            fontSize: 13.sp,
            fontWeight: FontWeight.normal,
            decoration: hasValidated ? TextDecoration.lineThrough : null,
            decorationColor: AppColors.chatScreenGrey,
            decorationThickness: 2,
            color:
                hasValidated ? AppColors.mainSoftBlue : AppColors.mainAppColor,
          ),
        )
      ],
    );
  }
}
