import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/common/widget/buttons/app_button.dart';
import 'package:graduation/common/widget/fields/app_textfield.dart';
import 'package:iconsax/iconsax.dart';

/// Form where the user will be able to sign up.
class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Expanded(
              child: AppTextFormField(
                hintText: "الاسم الاول",
                suffixIcon: const Icon(Iconsax.profile_add),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'الرجاء ادخال الاسم الاول';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: AppTextFormField(
                suffixIcon: const Icon(Iconsax.user),
                hintText: "الاسم الاخير",
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'الرجاء ادخال الاسم الاخير';
                  }
                  return null;
                },
              ),
            ),
          ],
        ),
        SizedBox(height: 20.h),
        AppTextFormField(
          onTap: () {},
          suffixIcon: const Icon(Iconsax.emoji_normal),
          hintText: "الجنس",
          validator: (value) {
            if (value!.isEmpty) {
              return 'الرجاء ادخال الجنس ';
            }
            return null;
          },
        ),
        SizedBox(height: 20.h),
        AppTextFormField(
          suffixIcon: const Icon(Iconsax.calendar),
          hintText: "تاريخ الميلاد",
          validator: (value) {
            if (value!.isEmpty) {
              return 'الرجاء ادخال تاريخ الميلاد ';
            }
            return null;
          },
        ),
        SizedBox(height: 20.h),
        AppTextFormField(
          suffixIcon: const Icon(Iconsax.direct_inbox),
          hintText: "البريد الالكتروني",
          validator: (value) {
            if (value!.isEmpty) {
              return 'الرجاء ادخال البريد الالكتروني';
            }
            return null;
          },
        ),
        SizedBox(height: 20.h),
        AppTextFormField(
          suffixIcon: const Icon(Iconsax.lock),
          hintText: "كلمة المرور",
          isObscureText: true,
          validator: (value) {
            if (value!.isEmpty) {
              return 'الرجاء ادخال كلمة المرور';
            }
            return null;
          },
        ),
        SizedBox(height: 20.h),
        AppTextFormField(
          suffixIcon: const Icon(Iconsax.lock_circle4),
          hintText: "تأكيد كلمة المرور",
          isObscureText: true,
          validator: (value) {
            if (value!.isEmpty) {
              return 'الرجاء تأكيد كلمة المرور';
            }
            return null;
          },
        ),
        SizedBox(height: 20.h),
        AppButton(
          press: () {},
          text: 'إنشاء حساب',
        ),
      ],
    );
  }
}
