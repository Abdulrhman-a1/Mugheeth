import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/common/helper/text.dart';
import 'package:graduation/common/theme/colors.dart';
import 'package:graduation/common/widget/custom_shape/app_container.dart';
import 'package:graduation/common/widget/custom_shape/text_and_icon.dart';
import 'package:graduation/features/history/ui/widgets/information_container.dart';

class MedicalHistoryCard extends StatelessWidget {
  final String date;
  final String category;
  final String status;
  final String diagnosis;
  final String recommendation;
  final String details;
  final bool isExpanded;
  final VoidCallback onExpandToggle;

  const MedicalHistoryCard({
    super.key,
    required this.date,
    required this.category,
    required this.status,
    required this.diagnosis,
    required this.recommendation,
    required this.details,
    required this.isExpanded,
    required this.onExpandToggle,
  });

  @override
  Widget build(BuildContext context) {
    final categoryStyle = getCategoryStyle(category);

    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.sp),
        border: Border.all(
          color: AppColors.mainSoftBlue,
          width: 2.sp,
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.all(20.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: AppContainer(
                      color: categoryStyle['color'],
                      textColor: Colors.white,
                      label: categoryStyle['text'],
                      onPressed: () {},
                      raduis: 20,
                    ),
                  ),
                  SizedBox(height: 10.sp),
                  SizedBox(height: 10.sp),
                  InformationContainer(status: status),
                  InformationContainer(diagnosis: diagnosis),
                  InformationContainer(recommendation: recommendation),
                  SizedBox(height: 10.sp),
                  TextAndIcon(
                    fontSize: 14,
                    iconPath: "assets/icons/file-case.png",
                    label: "ملخص الحالة",
                    description: details,
                    onPressed: () {},
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
