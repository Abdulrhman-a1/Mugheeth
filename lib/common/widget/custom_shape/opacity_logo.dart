import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///Small widget to show the logo with opacity.
class OpacityLogo extends StatelessWidget {
  const OpacityLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.4,
      child: Image.asset(
        'assets/images/logo.png',
        width: 150.w,
      ),
    );
  }
}
