import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/common/theme/colors.dart';

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
    return Column(
      children: [
        buildValidationRow('على الاقل حرف واحد صغير', hasLowerCase),
        SizedBox(width: 2.w),
        buildValidationRow('على الاقل حرف واحد كبير', hasUpperCase),
        SizedBox(width: 2.w),
        buildValidationRow('على الاقل رمز واحد', hasSpecialCharacters),
        SizedBox(width: 2.w),
        buildValidationRow('على الاقل رقم واحد', hasNumber),
        SizedBox(width: 2.w),
        buildValidationRow('يجب ان يكون اطول من ٨ ارقام', hasMinLength),
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
