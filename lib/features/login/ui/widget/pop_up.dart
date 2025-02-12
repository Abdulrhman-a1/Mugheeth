import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/common/theme/colors.dart';
import 'package:graduation/features/login/ui/widget/dont_have_acc.dart';
import 'package:graduation/features/login/ui/widget/sign_in_form.dart';

/// This is the design of the pop-up that appears when the user clicks on the sign-in button.
class RehisterPopUp extends StatefulWidget {
  const RehisterPopUp({
    super.key,
  });

  @override
  RehisterPopUpState createState() => RehisterPopUpState();
}

class RehisterPopUpState extends State<RehisterPopUp> {
  late bool isSignIn;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 600),
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [
            Colors.white.withOpacity(0.8),
            Colors.white10,
          ],
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(29),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: AppColors.mainAppColor.withOpacity(0.3),
              offset: const Offset(0, 3),
              blurRadius: 5,
            ),
            BoxShadow(
              color: AppColors.mainAppColor.withOpacity(0.3),
              offset: const Offset(0, 30),
              blurRadius: 30,
            ),
          ],
          color: Colors.white,
          backgroundBlendMode: BlendMode.luminosity,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SignInForm(),
            SizedBox(height: 20.h),
            const DontHaveAcc(),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}
