import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/common/helper/extensions.dart';
import 'package:graduation/common/widget/buttons/app_button.dart';
import 'package:graduation/common/widget/custom_shape/text_and_icon.dart';
import 'package:graduation/common/widget/pop_up/error_popup.dart';
import 'package:graduation/data/auth/service/auth_service.dart';
import 'package:graduation/features/feedback/ui/widgets/text_field.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  final AuthService authService = AuthService();
  final TextEditingController feedbackController = TextEditingController();

  Future<void> _submitFeedback() async {
    final feedbackText = feedbackController.text.trim();
    if (feedbackText.isNotEmpty) {
      await authService.submitFeedback(feedbackText);
      context.pop();
      showToastMessage(
        context,
        "تم إرسال تعليقك بنجاح",
        isError: false,
        "assets/icons/check.png",
      );
    } else {
      showToastMessage(
        context,
        "الرجاء كتابة تعليق قبل الإرسال",
        isError: true,
        "assets/icons/warning.png",
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(bottom: 20.0.sp),
        child: Column(
          children: [
            TextAndIcon(
              iconPath: "assets/icons/feedback.png",
              label: "قيم تجربتك",
              description: "وش رأيك في تجربتك معنا؟",
              onPressed: () {},
            ),
            const SizedBox(height: 20),
            AppMultiLineTextFormField(
              controller: feedbackController,
              hintText: 'أكتب تعليقك هنا',
              validator: (String) {},
            ),
            SizedBox(height: 20.h),
            AppButton(
              text: "إرسال",
              press: _submitFeedback,
            ),
          ],
        ),
      ),
    );
  }
}
