import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/common/helper/extensions.dart';
import 'package:graduation/common/widget/buttons/app_button.dart';
import 'package:graduation/common/widget/pop_up/error_popup.dart';
import 'package:graduation/data/auth/service/auth_service.dart';
import 'package:graduation/features/feedback/ui/widgets/text_field.dart';

class Complain extends StatefulWidget {
  const Complain({super.key});

  @override
  State<Complain> createState() => _QuestionState();
}

class _QuestionState extends State<Complain> {
  final AuthService authService = AuthService();
  final TextEditingController questionController = TextEditingController();

  //will be changed to COMPLAIN service
  Future<void> _submitQuetion() async {
    final feedbackText = questionController.text.trim();
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
            SizedBox(
              height: 70.h,
              child: AppMultiLineTextFormField(
                controller: questionController,
                hintText: 'ارسل تعليقك هنا',
                validator: (String) {},
              ),
            ),
            SizedBox(height: 20.h),
            AppButton(
              text: "إرسال",
              press: _submitQuetion,
            ),
          ],
        ),
      ),
    );
  }
}
