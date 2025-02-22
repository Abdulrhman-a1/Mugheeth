import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/common/theme/colors.dart';

class InformationContainer extends StatelessWidget {
  const InformationContainer({
    super.key,
    this.status,
    this.diagnosis,
    this.recommendation,
  });

  final String? status;
  final String? diagnosis;
  final String? recommendation;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (status != null) infobox("الحالة: $status"),
        if (diagnosis != null) infobox("التشخيص: $diagnosis"),
        if (recommendation != null) infobox("التوصية: $recommendation"),
        SizedBox(height: 16.sp),
      ],
    );
  }

  Widget infobox(String text) {
    Color boxColor;
    if (text.startsWith("التوصية")) {
      boxColor = Color(0xFFECF5FE);
      ;
    } else {
      boxColor = AppColors.lightGrey;
    }
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12.sp),
      decoration: BoxDecoration(
        color: boxColor,
        borderRadius: BorderRadius.circular(10.sp),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }
}
