import 'package:flutter/material.dart';
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
            boxShadow: [
              BoxShadow(
                color: AppColors.mainSoftBlue.withOpacity(0.25),
                blurRadius: 120,
                spreadRadius: 12,
                offset: const Offset(40, 20),
              ),
            ],
            shape: BoxShape.circle,
          ),
          width: MediaQuery.of(context).size.width * 0.55,
          child: Image.asset("assets/images/NoDocuments copy.png"),
        ),
        // Text(
        //   "لا يوجد لديك تاريخ مرضي، ابدا محادثة لتكوينه",
        //   style: TextStyle(
        //     fontSize: 16.sp,
        //     color: Colors.grey,
        //   ),
        //   textAlign: TextAlign.right,
        // ),
      ],
    );
  }
}
