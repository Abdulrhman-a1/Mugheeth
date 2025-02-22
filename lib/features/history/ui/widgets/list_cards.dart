import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/common/helper/text.dart';
import 'package:graduation/common/widget/animation/slider_animation.dart';
import 'package:graduation/features/history/ui/widgets/dots.dart';
import 'package:graduation/common/widget/custom_shape/history_card.dart';

class MedicalHistoryCards extends StatefulWidget {
  const MedicalHistoryCards({
    super.key,
  });

  @override
  State<MedicalHistoryCards> createState() => MedicalHistoryCardsState();
}

class MedicalHistoryCardsState extends State<MedicalHistoryCards> {
  final PageController pageController = PageController();
  int _currentPage = 0;
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedItem(
          index: 1,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.55,
            child: PageView.builder(
              controller: pageController,
              scrollDirection: Axis.horizontal,
              itemCount: medicalHistoryData.length,
              onPageChanged: (index) {
                setState(
                  () {
                    _currentPage = index;
                  },
                );
              },
              itemBuilder: (context, index) {
                final data = medicalHistoryData[index];
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: MedicalHistoryCard(
                    date: data['date']!,
                    category: data['category']!,
                    status: data['status']!,
                    diagnosis: data['diagnosis']!,
                    recommendation: data['recommendation']!,
                    details: data['details']!,
                    isExpanded: isExpanded,
                    onExpandToggle: () {
                      setState(
                        () {
                          isExpanded = !isExpanded;
                        },
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ),
        SizedBox(height: 16.h),
        Dots(widget: widget, currentPage: _currentPage),
      ],
    );
  }
}
