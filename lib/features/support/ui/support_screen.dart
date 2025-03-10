import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/common/widget/custom_shape/text_and_icon.dart';
import 'package:graduation/features/support/ui/widget/complain.dart';
import 'package:lottie/lottie.dart';

class Support extends StatelessWidget {
  const Support({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TextAndIcon(
            iconPath: "assets/icons/request.png",
            label: "تواصل معنا",
            description: "للإبلاغ عن مشكلة أو طلب مساعدة",
            onPressed: () {},
          ),
          Lottie.asset(
            'assets/lottie/chat.json',
            width: double.infinity,
            height: 170.0.sp,
          ),
          Complain()
        ],
      ),
    );
  }
}
