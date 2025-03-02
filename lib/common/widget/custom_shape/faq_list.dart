import 'package:flutter/material.dart';
import 'package:graduation/common/helper/text.dart';
import 'package:graduation/common/widget/animation/slider_animation.dart';
import 'package:graduation/common/widget/custom_shape/faq_conatiner.dart';

class FaqList extends StatefulWidget {
  const FaqList({super.key});

  @override
  State<FaqList> createState() => FaqListState();
}

class FaqListState extends State<FaqList> {
  @override
  Widget build(BuildContext context) {
    return AnimatedItem(
      index: 0,
      child: Column(
        children: [
          Container(
            constraints: BoxConstraints(maxHeight: 700, minHeight: 700),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: faqItems.length,
              itemBuilder: (context, index) {
                final item = faqItems[index];
                return FaqContainer(
                  index: index,
                  question: item['question']!,
                  answer: item['answer']!,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
