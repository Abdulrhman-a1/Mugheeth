import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/common/widget/custom_shape/text_and_icon.dart';
import 'package:graduation/common/widget/custom_shape/welcome_text.dart';
import 'package:graduation/features/sign_up/ui/widgets/sign_up_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.9,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.sp),
          topRight: Radius.circular(10.sp),
        ),
      ),
      padding: EdgeInsets.all(25.0.sp),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const WelcomeText(
                title: "نورت مُغيث!", desc: "قم بإنشاء حساب جديد"),
            const SignUpForm(),
            SizedBox(height: 20.h),
            TextAndIcon(
              iconPath: "assets/icons/lock.png",
              label: "سياسة الخصوصية",
              description: "بمجرد تفعيلك للحساب فأنت توافق على سياسة الخصوصية",
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
