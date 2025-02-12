import 'package:flutter/material.dart';
import 'package:graduation/features/Onbording/ui/widgets/chat_section.dart';
import 'package:graduation/features/Onbording/ui/widgets/title_and_desc.dart';
import 'package:graduation/features/Onbording/ui/widgets/welcoming.dart';

///Class to set the content of onBorading screen, and design it.
class OnboardingContent extends StatelessWidget {
  final String title;
  final String description;
  final Widget child;

  const OnboardingContent({
    super.key,
    required this.title,
    required this.description,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    //Used to show the title and description of the onboarding page.
    return TitleAndDescription(
        title: title, description: description, child: child);
  }
}

late PageController _pageController = PageController();

final List<OnboardingContent> pages = [
  OnboardingContent(
    title: 'حياك الله',
    description: 'نسعى في مغيث لتحسين حالتك الصحية',
    child: Welcoming(controller: _pageController),
  ),
  const OnboardingContent(
    title: 'محادثات فورية',
    description: 'بامكانك عرض حالتك الصحية على الذكاء الاصطناعي',
    child: ChatSection(),
  ),
];
