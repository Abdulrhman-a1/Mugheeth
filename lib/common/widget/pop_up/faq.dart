import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/common/theme/colors.dart';
import 'package:graduation/common/widget/custom_shape/text_and_icon.dart';
import 'package:graduation/common/widget/custom_shape/faq_list.dart';

///Bottom sheet to show questions and answers about the project
class FaqBottomSheet extends StatefulWidget {
  const FaqBottomSheet({super.key});

  @override
  State<FaqBottomSheet> createState() => _FaqBottomSheetState();
}

class _FaqBottomSheetState extends State<FaqBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.chatScreenGrey,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      padding: EdgeInsets.all(16.sp),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextAndIcon(
            iconPath: "assets/icons/faq.png",
            label: "الاسئلة الشائعة",
            description: "وش في بالك تعرف عن مُغيث؟",
            onPressed: () {},
          ),
          SizedBox(height: 16.sp),
          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 700.h, minHeight: 500.h),
            child: const FaqList(),
          ),
        ],
      ),
    );
  }
}
