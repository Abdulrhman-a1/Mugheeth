import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/common/theme/colors.dart';

class EmptyHistory extends StatelessWidget {
  const EmptyHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.transparent,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.mainSoftBlue.withOpacity(0.3),
                  blurRadius: 120,
                  spreadRadius: 1,
                  offset: const Offset(0, 0),
                ),
              ]),
          width: MediaQuery.of(context).size.width * 0.55,
          child: Image.asset(
            "assets/images/NoDocuments copy.png",
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Text(
            "لا يوجد لديك تاريخ مرضي",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16.sp, color: AppColors.mainAppGrey),
          ),
        ),
      ],
    );
  }
}
