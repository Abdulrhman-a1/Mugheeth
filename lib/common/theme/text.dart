import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:graduation/common/theme/colors.dart';

List<Map<String, String>> getLocalizedFaqItems(BuildContext context) {
  final loc = AppLocalizations.of(context)!;

  final List<Map<String, String>> faqItems = [
    {
      'question': loc.question1,
      'answer': loc.answer1,
    },
    {
      'question': loc.question2,
      'answer': loc.answer2,
    },
    {
      'question': loc.question3,
      'answer': loc.answer3,
    },
    {
      'question': loc.question4,
      'answer': loc.answer4,
    },
    {
      'question': loc.question5,
      'answer': loc.answer5,
    },
    {
      'question': loc.question6,
      'answer': loc.answer6,
    },
    {
      'question': loc.question7,
      'answer': loc.answer7,
    },
    {
      'question': loc.question8,
      'answer': loc.answer8,
    },
    {
      'question': loc.question9,
      'answer': loc.answer9,
    },
    {
      'question': loc.question10,
      'answer': loc.answer10,
    },
    {
      'question': loc.question11,
      'answer': loc.answer11,
    },
    {
      'question': loc.question12,
      'answer': loc.answer12,
    },
    {
      'question': loc.question13,
      'answer': loc.answer13,
    },
    {
      'question': loc.question14,
      'answer': loc.answer14,
    },
    {
      'question': loc.question15,
      'answer': loc.answer15,
    },
  ];
  return faqItems;
}

Color getLevelColor(String levelText) {
  final RegExp digitExtractor = RegExp(r'\d');
  final match = digitExtractor.firstMatch(levelText);
  final levelNumber = match != null ? int.tryParse(match.group(0)!) ?? 0 : 0;

  switch (levelNumber) {
    case 1:
      return Colors.red.shade400;
    case 2:
      return Colors.red.shade300;
    case 3:
      return Colors.red.shade300;
    case 4:
      return Colors.blue;
    case 5:
      return Colors.green;
    default:
      return AppColors.mainAppColor;
  }
}

bool isArabicText(String text) {
  final arabicRegex = RegExp(r'[\u0600-\u06FF]');
  return arabicRegex.hasMatch(text);
}
