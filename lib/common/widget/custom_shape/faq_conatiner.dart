import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:graduation/common/theme/colors.dart'; // Ensure this import is correct

class FaqContainer extends StatefulWidget {
  final int index;
  final String question;
  final String answer;

  const FaqContainer({
    Key? key, // Use `Key?` instead of `super.key`
    required this.index,
    required this.question,
    required this.answer,
  }) : super(key: key);

  @override
  State<FaqContainer> createState() => _FaqContainerState();
}

class _FaqContainerState extends State<FaqContainer> {
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
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.lightGrey,
              border: Border.all(
                color: Colors.grey.withOpacity(0.2),
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        widget.question,
                        style: TextStyle(
                          color: AppColors.mainAppColor,
                          fontWeight: FontWeight.w800,
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                    Icon(
                      _isExpanded ? Icons.expand_less : Icons.expand_more,
                      color:
                          _isExpanded ? Colors.white : AppColors.mainSoftBlue,
                    ),
                  ],
                ),
                if (_isExpanded)
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: FadeIn(
                      child: Text(
                        widget.answer,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: AppColors.mainSoftBlue,
                          fontSize: 13.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8.0),
      ],
    );
  }
}
