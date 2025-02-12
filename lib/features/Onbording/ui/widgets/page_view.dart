import 'package:flutter/material.dart';
import 'package:graduation/features/Onbording/ui/widgets/content.dart';

///Page builder in onboarding screen.
class OnboardingPageView extends StatelessWidget {
  final PageController pageController;
  final int Function(int) onPageChanged;
  final List<OnboardingContent> pages;

  const OnboardingPageView({
    super.key,
    required this.pageController,
    required this.onPageChanged,
    required this.pages,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      onPageChanged: onPageChanged,
      itemCount: pages.length,
      itemBuilder: (context, index) {
        return pages[index];
      },
    );
  }
}
