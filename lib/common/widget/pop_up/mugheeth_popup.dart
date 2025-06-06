import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/common/theme/colors.dart';
import 'package:graduation/common/theme/text_style.dart';
import 'package:graduation/common/widget/custom_shape/floating_point.dart';
import 'package:graduation/common/widget/custom_shape/mugheeth_features.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

//This will open the recording screen where user can start talk and we will do speech to text!
void showMugheeth(BuildContext context) {
  Navigator.of(context).push(
    PageRouteBuilder(
      opaque: false,
      pageBuilder: (context, animation, secondaryAnimation) {
        return const MugheethPopup();
      },
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    ),
  );
}

class MugheethPopup extends StatelessWidget {
  const MugheethPopup({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.mainAppColor.withOpacity(0.4),
                  Colors.white.withOpacity(0.5),
                ],
              ),
            ),
            child: Center(
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 32.0.h, vertical: 64.0.h),
                child: Column(
                  children: [
                    Align(
                      alignment: loc.localeName == 'ar'
                          ? Alignment.topLeft
                          : Alignment.topRight,
                      child: const FloatingPointWidget(),
                    ),
                    Align(
                      alignment: loc.localeName == 'ar'
                          ? Alignment.topRight
                          : Alignment.topLeft,
                      child: Text(
                        loc.mugheethfeatures,
                        style: TextStyles.mugheethServices,
                      ),
                    ),
                    SizedBox(height: 20.0.h),
                    const MugheethFeatures()
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
