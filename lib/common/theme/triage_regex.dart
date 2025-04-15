Map<String, String> parseTriageResult(String message) {
  final result = <String, String>{};

  final englishLevel = RegExp(r'Triage Level:\s(.+?)(?:\n|$)');
  final englishConcern = RegExp(r'Likely Concern:\s(.+?)(?:\n|$)');
  final englishRecommendation = RegExp(r'Recommendation:\s*(.+?)(?:\n|$)');

  final arabicLevel = RegExp(r'مستوى الفرز:\s(.+?)(?:\n|$)');
  final arabicConcern = RegExp(r'الاحتمال الطبي:\s(.+?)(?:\n|$)');
  final arabicRecommendation = RegExp(r'التوصية:\s*(.+?)(?:\n|$)');

  final levelMatch = englishLevel.firstMatch(message);
  final concernMatch = englishConcern.firstMatch(message);
  final recommendationMatch = englishRecommendation.firstMatch(message);

  final arabicLevelMatch = arabicLevel.firstMatch(message);
  final arabicConcernMatch = arabicConcern.firstMatch(message);
  final arabicRecommendationMatch = arabicRecommendation.firstMatch(message);

  if (levelMatch != null) {
    result['level'] = levelMatch.group(1)?.trim() ?? 'Unknown';
  } else if (arabicLevelMatch != null) {
    result['level'] = arabicLevelMatch.group(1)?.trim() ?? 'Unknown';
  } else {
    result['level'] = 'Unknown';
  }

  if (concernMatch != null) {
    result['concern'] = concernMatch.group(1)?.trim() ?? 'Unknown';
  } else if (arabicConcernMatch != null) {
    result['concern'] = arabicConcernMatch.group(1)?.trim() ?? 'Unknown';
  } else {
    result['concern'] = 'Unknown';
  }

  if (recommendationMatch != null) {
    result['recommendation'] = recommendationMatch.group(1)?.trim() ?? '';
  } else if (arabicRecommendationMatch != null) {
    result['recommendation'] = arabicRecommendationMatch.group(1)?.trim() ?? '';
  } else {
    result['recommendation'] = '';
  }

  return result;
}

bool detectArabic(String text) {
  final arabicRegex = RegExp(r'[\u0600-\u06FF]');
  return arabicRegex.hasMatch(text);
}
