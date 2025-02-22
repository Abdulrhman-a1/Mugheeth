import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/common/helper/extensions.dart';
import 'package:graduation/common/theme/colors.dart';
import 'package:graduation/common/theme/text_style.dart';
import 'package:graduation/common/widget/animation/slider_animation.dart';
import 'package:graduation/common/widget/layout/screen.dart';
import 'package:graduation/features/Onbording/ui/widgets/button.dart';
import 'package:graduation/features/Onbording/ui/widgets/medical_history.dart';
import 'package:graduation/features/Onbording/ui/widgets/page_view.dart';
import 'package:graduation/features/Onbording/ui/widgets/chat_section.dart';
import 'package:graduation/features/Onbording/ui/widgets/title_and_desc.dart';
import 'package:graduation/features/Onbording/ui/widgets/welcoming.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late final PageController _pageController;
  int currentPageIndex = 0;
  late final List<OnboardingContent> pages;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    pages = [
      OnboardingContent(
        title: 'اهلًا بك في مغيث!',
        description:
            'مُغيث يُرشدك للرعاية الطبية الصحيحة، في اللحظة التي تحتاجها',
        child: Welcoming(controller: _pageController),
      ),
      OnboardingContent(
        title: 'لا تنتظر.. اعرف حالتك الآن!',
        description:
            'رعايتك الصحية تبدأ بمحادثة، وتمنحك رؤية أوضح لحالتك قبل زيارة المستشفى',
        child: ChatSection(
          controller: _pageController,
        ),
      ),
      OnboardingContent(
        title: 'احتفظ بتاريخك الطبي لمتابعة دقيقة',
        description:
            ' يساعدك مُغيث في معرفة حالتك الصحية قبل زيارة المستشفى، مما يسهل عملية التشخيص ويوجهك للرعاية المناسبة بسرعة',
        child: MedicalHistory(
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

  int _onPageChanged(int index) {
    setState(() {
      currentPageIndex = index;
    });
    return currentPageIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Screen(
      allowDrawer: false,
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
              child: OnboardingPageView(
                pageController: _pageController,
                onPageChanged: _onPageChanged,
                pages: pages,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 60),
              child: OnboardingIndicator(
                currentPage: currentPageIndex,
                totalPage: pages.length,
                onNext: () {
                  if (_pageController.page! < pages.length - 1) {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 800),
                      curve: Curves.easeInOut,
                    );
                  } else {
                    context.pushNamed('/chat');
                  }
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0.0.sp, 0.sp, 250.0.sp, 10.sp),
              child: TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                ),
                onPressed: () {
                  context.pushNamed('/chat');
                },
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
    return TitleAndDescription(
        title: title, description: description, child: child);
  }
}
