import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/common/widget/animation/slider_animation.dart';
import 'package:graduation/common/widget/custom_shape/text_and_icon.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// The content of mugheeth features popup with staggered animation.
class MugheethFeatures extends StatelessWidget {
  const MugheethFeatures({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return SingleChildScrollView(
      child: Column(
        children: [
          AnimatedItem(
            index: 0,
            child: TextAndIcon(
              iconPath: 'assets/icons/prioritiz.png',
              label: loc.medical_priority_title,
              description: loc.medical_priority_description,
              onPressed: () {},
            ),
          ),
          SizedBox(height: 25.h),
          AnimatedItem(
            index: 1,
            child: TextAndIcon(
              iconPath: 'assets/icons/chat.png',
              label: loc.instant_assessment_title,
              description: loc.instant_assessment_description,
              onPressed: () {},
            ),
          ),
          SizedBox(height: 25.h),
          AnimatedItem(
            index: 2,
            child: TextAndIcon(
              iconPath: 'assets/icons/piin.png',
              label: loc.hospital_map_title,
              description: loc.hospital_map_description,
              onPressed: () {},
            ),
          ),
          SizedBox(height: 25.h),
          AnimatedItem(
            index: 3,
            child: TextAndIcon(
              iconPath: 'assets/icons/medical-records.png',
              label: loc.electronic_medical_record_title,
              description: loc.electronic_medical_record_description,
              onPressed: () {},
            ),
          ),
          SizedBox(height: 25.h),
          AnimatedItem(
            index: 4,
            child: TextAndIcon(
              iconPath: 'assets/icons/language.png',
              label: loc.multilingual_support_title,
              description: loc.multilingual_support_description,
              onPressed: () {},
            ),
          ),
          SizedBox(height: 25.h),
          AnimatedItem(
            index: 5,
            child: TextAndIcon(
              iconPath: 'assets/icons/easy-use.png',
              label: loc.ease_of_use_title,
              description: loc.ease_of_use_description,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
