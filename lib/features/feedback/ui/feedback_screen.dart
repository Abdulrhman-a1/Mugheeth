import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/common/routing/extensions.dart';
import 'package:graduation/common/widget/buttons/app_button.dart';
import 'package:graduation/common/widget/custom_shape/text_and_icon.dart';
import 'package:graduation/common/widget/pop_up/error_popup.dart';
import 'package:graduation/data/auth/service/auth_service.dart';
import 'package:graduation/features/feedback/ui/widgets/text_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  final AuthService authService = AuthService();
  final TextEditingController feedbackController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(bottom: 20.0.sp),
        child: Column(
          children: [
            TextAndIcon(
              iconPath: "assets/icons/feedback.png",
              label: loc.feedback_title,
              description: loc.feedback_description,
              onPressed: () {},
            ),
            const SizedBox(height: 20),
            AppMultiLineTextFormField(
              controller: feedbackController,
              hintText: loc.feedback_hint,
              validator: (String) {},
            ),
            SizedBox(height: 20.h),
            AppButton(
              text: loc.feedback_submit,
              press: () => _submitFeedback(loc),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _submitFeedback(AppLocalizations loc) async {
    final feedbackText = feedbackController.text.trim();
    if (feedbackText.isNotEmpty) {
      await authService.submitFeedback(feedbackText);
      context.pop();
      showToastMessage(
        context,
        loc.feedback_sent,
        isError: false,
        "assets/icons/check.png",
      );
    } else {
      showToastMessage(
        context,
        loc.feedback_empty,
        isError: true,
        "assets/icons/warning.png",
      );
    }
  }
}
