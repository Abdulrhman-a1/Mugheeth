import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:graduation/common/theme/colors.dart';

class FaqConatiner extends StatefulWidget {
  final int index;
  final String question;
  final String answer;

  const FaqConatiner({
    super.key,
    required this.index,
    required this.question,
    required this.answer,
  });

  @override
  State<FaqConatiner> createState() => _FaqConatinerState();
}

class _FaqConatinerState extends State<FaqConatiner> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey.withOpacity(0.2),
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.question,
                  style: const TextStyle(
                    color: AppColors.mainAppColor,
                    fontWeight: FontWeight.w800,
                    fontSize: 14.0,
                  ),
                ),
                Icon(
                  _isExpanded ? Icons.expand_less : Icons.expand_more,
                  color: AppColors.mainSoftBlue,
                ),
              ],
            ),
          ),
        ),
        if (_isExpanded)
          Padding(
            padding: const EdgeInsets.only(
              top: 8.0,
              left: 16.0,
              right: 16.0,
            ),
            child: FadeInRight(
              child: Text(
                widget.answer,
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  color: AppColors.mainSoftBlue,
                  fontSize: 13.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        const SizedBox(height: 8.0),
      ],
    );
  }
}
