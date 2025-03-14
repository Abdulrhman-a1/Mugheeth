import 'package:animated_introduction/animated_introduction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:graduation/common/helper/extensions.dart';
import 'package:graduation/common/helper/lang_provider.dart';
import 'package:graduation/common/theme/colors.dart';
import 'package:graduation/common/theme/text_style.dart';
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

  void _nextPage() {
    if (_pageController.page! < 2) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.of(context).pushReplacementNamed('/chat');
    }
  }

  void _skip() {
    Navigator.of(context).pushReplacementNamed('/chat');
  }

  void _onPageChanged(int index) {
    setState(() {
      currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    final pages = [
      SingleIntroScreen(
        slidePagePadding: EdgeInsets.zero,
        imageHeightMultiple: 0,
        title: loc.welcome_title,
        description: loc.welcome_description,
        headerWidget: Welcoming(controller: _pageController),
      ),
      SingleIntroScreen(
        slidePagePadding: EdgeInsets.zero,
        imageHeightMultiple: 0,
        title: loc.chat_section_title,
        description: loc.chat_section_description,
        headerWidget: ChatSection(controller: _pageController),
      ),
      SingleIntroScreen(
        slidePagePadding: EdgeInsets.zero,
        imageHeightMultiple: 0,
        title: loc.medical_history_title,
        description: loc.medical_history_description,
        headerWidget: MedicalHistory(controller: _pageController),
      ),
    ];

    return Screen(
      allowDrawer: false,
      backgroundColor: Colors.white,
      onClearMessages: () {},
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: AppBar(
                backgroundColor: Colors.white,
                leading: GestureDetector(
                  onTap: () {
                    context.read<LocaleProvider>().toggleLocale();
                  },
                  child: Row(
                    children: [
                      Text(
                        loc.localeName == 'ar' ? 'English' : "العربية",
                        style: TextStyles.onboardingDesc.copyWith(
                          color: AppColors.mainAppColor,
                          fontSize: 13.sp,
                          fontFamily: loc.localeName == 'en'
                              ? 'IBMPlexSansArabic'
                              : 'Share',
                        ),
                      ),
                    ],
                  ),
                ),
                title: Opacity(
                  opacity: 0.6,
                  child: Image.asset(
                    'assets/images/logo.png',
                    height: 35.h,
                  ),
                ),
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: _onPageChanged,
                itemCount: pages.length,
                itemBuilder: (context, index) => AnimatedIntroduction(
                  containerBg: Colors.white,
                  textColor: AppColors.mainAppColor,
                  footerBgColor: Colors.white,
                  topHeightForFooter: 400,
                  footerRadius: 30,
                  nextText: '',
                  skipText: '',
                  doneText: '',
                  slides: [pages[index]],
                  indicatorType: IndicatorType.circle,
                  onDone: () => context.pushReplacementNamed('/chat'),
                  onSkip: _skip,
                ),
              ),
            ),
            OnboardingIndicator(
              currentPage: currentPageIndex,
              totalPage: pages.length,
              onNext: _nextPage,
            ),
            Align(
              alignment: AlignmentDirectional.bottomEnd,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0, 20, 0),
                child: TextButton(
                  style: ButtonStyle(
                    overlayColor: WidgetStateProperty.all(Colors.transparent),
                  ),
                  onPressed: _skip,
                  child: Text(
                    loc.skip,
                    style: TextStyles.onboardingDesc.copyWith(
                      color: AppColors.mainAppColor,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}
