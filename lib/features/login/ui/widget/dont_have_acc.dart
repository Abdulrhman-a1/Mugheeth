import 'package:flutter/material.dart';
import 'package:graduation/common/theme/colors.dart';
import 'package:graduation/common/theme/text_style.dart';
import 'package:graduation/common/widget/animation/animation_bottom_sheet.dart';
import 'package:graduation/features/sign_up/ui/sign_up.dart';

/// If user don't have an account, this text will appear to create a new account.
class DontHaveAcc extends StatelessWidget {
  const DontHaveAcc({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showSignUpBottomSheet(context),
      child: Text(
        "ليس لديك حساب؟ سجل الآن",
        style: TextStyles.loginButtonText.copyWith(
          color: AppColors.mainAppColor,
          fontSize: 16,
        ),
      ),
    );
  }
}

//To show sign up bottom sheet.
void showSignUpBottomSheet(BuildContext context) {
  showModalBottomSheet(
    showDragHandle: false,
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return const AnimatedBottomSheet(child: SignUpScreen());
    },
  );
}
