import 'package:animated_introduction/animated_introduction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/common/helper/extensions.dart';
import 'package:graduation/common/theme/colors.dart';
import 'package:graduation/common/theme/text_style.dart';
import 'package:graduation/common/widget/animation/slider_animation.dart';
import 'package:graduation/common/widget/layout/screen.dart';
import 'package:graduation/features/Onbording/ui/widgets/button.dart';
import 'package:graduation/features/Onbording/ui/widgets/medical_history.dart';
import 'package:graduation/features/Onbording/ui/widgets/chat_section.dart';
import 'package:graduation/features/Onbording/ui/widgets/welcoming.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late final PageController _pageController;
  int currentPageIndex = 0;
  late final List<SingleIntroScreen> pages;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();

    pages = [
      SingleIntroScreen(
        slidePagePadding: EdgeInsets.all(0),
        imageHeightMultiple: 0,
        title: 'اهلًا بك في مغيث!',
        description:
            'مُغيث يُرشدك للرعاية الطبية الصحيحة، في اللحظة التي تحتاجها',
        headerWidget: Welcoming(controller: _pageController),
      ),
      SingleIntroScreen(
        slidePagePadding: EdgeInsets.all(0),
        imageHeightMultiple: 0,
        title: 'لا تنتظر.. اعرف حالتك الآن!',
        description:
            'رعايتك الصحية تبدأ بمحادثة، وتمنحك رؤية أوضح لحالتك قبل زيارة المستشفى',
        headerWidget: ChatSection(
          controller: _pageController,
        ),
      ),
      SingleIntroScreen(
        slidePagePadding: EdgeInsets.all(0),
        imageHeightMultiple: 0,
        title: 'احتفظ بتاريخك الطبي لمتابعة دقيقة',
        description:
            ' يساعدك مُغيث في معرفة حالتك الصحية قبل زيارة المستشفى، مما يسهل عملية التشخيص ويوجهك للرعاية المناسبة بسرعة',
        headerWidget: MedicalHistory(
          controller: _pageController,
        ),
      ),
    ];
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_pageController.page! < pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    } else {
      // Navigate to chat screen and prevent back navigation
      Navigator.of(context).pushReplacementNamed('/chat');
    }
  }

  void _skip() {
    // Navigate to chat screen and prevent back navigation
    Navigator.of(context).pushReplacementNamed('/chat');
  }

  void _onPageChanged(int index) {
    setState(() {
      currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Screen(
      allowDrawer: false,
      backgroundColor: Colors.white,
      child: SafeArea(
        child: Column(
          children: [
            AnimatedItem(
              index: 1,
              child: Opacity(
                opacity: 0.6,
                child: Image.asset(
                  'assets/images/logo.png',
                  height: 35.h,
                ),
              ),
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: _onPageChanged,
                children: pages.map(
                  (page) {
                    return AnimatedIntroduction(
                      containerBg: Colors.white,
                      textColor: AppColors.mainAppColor,
                      footerBgColor: Colors.white,
                      topHeightForFooter: 450,
                      footerRadius: 30,
                      nextText: '',
                      skipText: '',
                      doneText: '',
                      slides: [page],
                      indicatorType: IndicatorType.circle,
                      onDone: () {
                        context.pushReplacementNamed('/chat');
                      },
                      onSkip: _skip,
                    );
                  },
                ).toList(),
              ),
            ),
            OnboardingIndicator(
              currentPage: currentPageIndex,
              totalPage: pages.length,
              onNext: _nextPage,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0.0.sp, 0.sp, 250.0.sp, 10.sp),
              child: TextButton(
                style: ButtonStyle(
                  overlayColor: WidgetStatePropertyAll(Colors.transparent),
                ),
                onPressed: _skip,
                child: Text(
                  "تخطي",
                  style: TextStyles.onboardingDesc.copyWith(
                    color: AppColors.mainAppColor,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
