import 'package:flutter/material.dart';
import 'package:graduation/common/widget/buttons/close_button.dart';
import 'package:graduation/features/login/ui/widget/pop_up.dart';

class LoginSignupDialog extends StatelessWidget {
  const LoginSignupDialog({super.key, this.onDialogClosed});

  final VoidCallback? onDialogClosed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Stack(
          children: [
            const RehisterPopUp(),
            Positioned(
              right: 20,
              child: ExitButton(
                onDialogClosed: onDialogClosed, // Pass the callback directly
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Show the login dialog and call setState on close
void showLoginDialog(BuildContext context, VoidCallback onDialogClosed) {
  showGeneralDialog(
    context: context,
    barrierDismissible: false,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: Colors.black.withOpacity(0.3),
    transitionDuration: const Duration(milliseconds: 500),
    pageBuilder: (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation) {
      return Center(
        child: Material(
          color: Colors.transparent,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, -1),
              end: Offset.zero,
            ).animate(CurvedAnimation(
              parent: animation,
              curve: Curves.easeOut,
            )),
            child: LoginSignupDialog(onDialogClosed: onDialogClosed),
          ),
        ),
      );
    },
  ).then((_) {
    // Always call the callback when the dialog is closed
    onDialogClosed();
  });
}
