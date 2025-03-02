import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/common/widget/custom_shape/text_and_icon.dart';
import 'package:graduation/features/setting/ui/widget/user_info.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/theme/colors.dart';

class GeneralSetting extends StatelessWidget {
  const GeneralSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.sp, vertical: 24.sp),
      child: Column(
        children: [
          TextAndIcon(
            iconPath: "assets/icons/world.png",
            label: "اللغة",
            description: "غير اللغة و حط اللي تناسبك",
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
                infoContent("اللغة", "العربية", Iconsax.language_circle),
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
