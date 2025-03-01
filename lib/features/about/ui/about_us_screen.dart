import 'package:flutter/material.dart';
import 'package:graduation/common/theme/colors.dart';
import 'package:graduation/common/widget/custom_shape/app_top_bar.dart';
import 'package:graduation/common/widget/layout/screen.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Screen(
      backgroundColor: AppColors.chatScreenGrey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const AppTopBar(),
          ],
        ),
      ),
    );
  }
}
