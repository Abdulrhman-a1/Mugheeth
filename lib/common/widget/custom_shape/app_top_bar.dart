import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/common/theme/colors.dart';
import 'package:graduation/common/widget/animation/slider_animation.dart';

/// app bar; show app name and burger menu.
class AppTopBar extends StatelessWidget {
  const AppTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      leading: Builder(
        builder: (context) {
          return IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            icon: const Icon(Icons.arrow_back, color: AppColors.mainAppColor),
            onPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  '/chat', (Route<dynamic> route) => false);
            },
          );
        },
      ),
      title: AnimatedItem(
        index: 1,
        child: Image.asset(
          "assets/images/logo.png",
          width: 45.w,
        ),
      ),
    );
  }
}
