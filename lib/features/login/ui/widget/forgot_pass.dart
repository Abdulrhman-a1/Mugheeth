import 'package:flutter/material.dart';
import 'package:graduation/common/theme/colors.dart';
import 'package:graduation/common/theme/text_style.dart';
import 'package:graduation/common/widget/animation/animation_bottom_sheet.dart';
import 'package:graduation/features/forgot_pass/ui/forgot_pass.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

///A button that allows the user to reset their password.
class ForgotPassButton extends StatelessWidget {
  const ForgotPassButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Align(
      alignment:
          loc.localeName == 'en' ? Alignment.centerLeft : Alignment.centerRight,
      child: TextButton(
        style: const ButtonStyle(
          overlayColor: WidgetStatePropertyAll(Colors.transparent),
        ),
        onPressed: () {
          //We can use this line to close the current bottom sheet.
          //context.pop();
          forgotPass(context);
        },
        child: Text(
          loc.forgot_password,
          style: TextStyles.loginButtonText.copyWith(
            color: AppColors.mainAppColor,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

//To show forgot password bottom sheet.
void forgotPass(BuildContext context) {
  showModalBottomSheet(
    showDragHandle: false,
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: const AnimatedBottomSheet(child: ForgotPassScreen()),
      );
    },
  );
}
