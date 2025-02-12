import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/common/helper/extensions.dart';
import 'package:graduation/common/widget/animation/slider_animation.dart';
import 'package:graduation/common/widget/layout/screen.dart';
import 'package:graduation/features/Onbording/ui/widgets/button.dart';
import 'package:graduation/features/Onbording/ui/widgets/content.dart';
import 'package:graduation/features/Onbording/ui/widgets/page_view.dart';

///Onboarding screen that contains the onboarding pages and the indicator.
class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late final PageController _pageController;
  int currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  int _onPageChanged(int index) {
    setState(() {
      currentPageIndex = index;
    });
    return currentPageIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Screen(
      child: SafeArea(
        child: Column(
          children: [
            //This is the logo appear from center to top when user finsih the splash
            AnimatedItem(
              index: 1,
              child: Image.asset(
                'assets/images/logo.png',
                height: 45.h,
              ),
            ),
            Expanded(
              child: OnboardingPageView(
                pageController: _pageController,
                onPageChanged: _onPageChanged,
                pages: pages,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 120),
              child: OnboardingIndicator(
                currentPage: currentPageIndex,
                totalPage: pages.length,
                onNext: () {
                  //if not last page = scroll inside onboarding
                  if (_pageController.page! < pages.length - 1) {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 800),
                      curve: Curves.easeInOut,
                    );
                  } else {
                    //if last page = navigate to chat screen
                    context.pushNamed('/chat');
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
