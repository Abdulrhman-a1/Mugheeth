import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/common/widget/buttons/app_button.dart';
import 'package:graduation/common/widget/custom_shape/text_and_icon.dart';
import 'package:lottie/lottie.dart';

class GuestPopup extends StatelessWidget {
  const GuestPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(bottom: 30.0.sp),
        child: Column(
          children: [
            TextAndIcon(
              iconPath: "assets/icons/security.png",
              label: "الخدمة غير متاحة",
              description: "الرجاء تسجيل الدخول للوصول على الخدمة",
              onPressed: () {},
            ),
            // Image.asset(
            //   "assets/icons/logins.png",
            //   width: 200.0.sp,
            // ),
            SizedBox(height: 20.0.sp),
            Lottie.asset(
              "assets/lottie/r.json",
              width: 200.0.sp,
              height: 200.0.sp,
            ),
            SizedBox(height: 20.0.sp),

            AppButton(
                text: "اذهب لتسجيل الدخول",
                press: () {
                  Navigator.of(context).pop();
                }),
          ],
        ),
      ),
    );
  }
}
