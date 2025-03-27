import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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

final List<Map<String, String>> medicalHistoryData = [
  {
    'date': '١٢ أكتوبر ٢٠٢٥',
    'category': 'Level1',
    'status':
        'أعاني من ألم حاد في الصدر مع ضيق شديد في التنفس وسعال مستمر مصحوب بالبلغم.',
    'diagnosis': 'التهاب رئوي حاد',
    'recommendation': 'دخول المستشفى والعلاج بالمضادات الحيوية عبر الوريد',
    'details':
        'المريض يعاني من ضيق حاد في التنفس وألم في الصدر يزداد مع التنفس العميق، مصحوب بسعال مستمر مع بلغم أصفر مخضر. التشخيص يشير إلى التهاب رئوي حاد، مع احتمالية وجود عدوى بكتيرية تستدعي العلاج الفوري بالمضادات الحيوية عبر الوريد داخل المستشفى.'
  },
  {
    'date': '٢٧ أكتوبر ٢٠٢٥',
    'category': 'Level2',
    'status': 'أشعر بألم في الصدر عند التنفس العميق وسعال جاف متكرر منذ يومين.',
    'diagnosis': 'التهاب رئوي متوسط',
    'recommendation': 'الراحة في المنزل مع تناول مضادات حيوية وشرب السوائل',
    'details':
        'المريض يعاني من أعراض التهاب رئوي متوسطة، تشمل ألمًا في الصدر عند التنفس العميق، وسعالًا جافًا متكررًا، وارتفاعًا طفيفًا في درجة الحرارة. الفحص السريري والأشعة يشيران إلى التهال رئوي غير معقد، يمكن علاجه بالمضادات الحيوية عن طريق الفم مع الراحة في المنزل وشرب السوائل بكثرة.'
  },
];

getCategoryStyle(String category) {
  switch (category) {
    case 'Level1':
      return {
        'color': Colors.red[400]!,
        'text': 'التصنيف: حالة حرجة جدًا',
      };
    case 'Level2':
      return {
        'color': Colors.red[400]!,
        'text': 'التصنيف:  طارئة',
      };
    case 'Level3':
      return {
        'color': Colors.red[400]!,
        'text': 'التصنيف:  حالة عاجلة',
      };
    case 'Level4':
      return {
        'color': Colors.green[400]!,
        'text': 'التصنيف: مستوى غير عاجل',
      };
    case 'Level5':
      return {
        'color': Colors.green[300]!,
        'text': 'التصنيف:  غير خطيرة',
      };
    default:
      return {
        'color': Colors.grey[400]!,
        'text': 'التصنيف: غير محدد',
      };
  }
}
