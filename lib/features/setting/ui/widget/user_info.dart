import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/common/theme/colors.dart';
import 'package:graduation/common/widget/custom_shape/text_and_icon.dart';
import 'package:iconsax/iconsax.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.sp, vertical: 24.sp),
      child: Column(
        children: [
          TextAndIcon(
            iconPath: "assets/icons/user.png",
            label: "ادارة حسابك",
            description: "تقدر تعدل على معلوماتك الشخصية من هنا",
            onPressed: () {},
          ),
          const SizedBox(height: 16),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 8,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: Column(
              children: [
                infoContent("الاسم", "وائل", Iconsax.note_add),
                Divider(color: AppColors.mainAppGrey.withOpacity(0.2)),
                infoContent("البريد الالكتروني", "Waeelalessa5@gmail.com",
                    Iconsax.direct_inbox),
                Divider(color: AppColors.mainAppGrey.withOpacity(0.2)),
                infoContent("تاريخ الميلاد", "05/02/2003", Iconsax.calendar),
                Divider(color: AppColors.mainAppGrey.withOpacity(0.2)),
                infoContent("الجنس", "ذكر", Iconsax.user),
                Divider(color: AppColors.mainAppGrey.withOpacity(0.2)),
                infoContent("كلمة المرور", "********", Iconsax.code),
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget infoContent(String label, String value, IconData icon) {
  return Padding(
    padding: EdgeInsets.all(16.0.sp),
    child: Row(
      children: [
        Icon(icon, color: AppColors.mainSoftBlue),
        SizedBox(width: 16.w),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.mainAppColor,
                    fontSize: 14.sp),
              ),
              Text(value),
            ],
          ),
        ),
      ],
    ),
  );
}
