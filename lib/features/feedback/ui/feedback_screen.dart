import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/common/helper/extensions.dart';
import 'package:graduation/common/widget/buttons/app_button.dart';
import 'package:graduation/common/widget/custom_shape/text_and_icon.dart';
import 'package:graduation/common/widget/pop_up/error_popup.dart';
import 'package:graduation/features/feedback/ui/widgets/text_field.dart';

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({super.key});

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
              hintText: 'أكتب تعليقك هنا',
              validator: (String) {},
            ),
            SizedBox(height: 20.h),
            AppButton(
              text: "إرسال",
              press: () {
                context.pop();
                showToastMessage(
                  context,
                  "تم إرسال تعليقك بنجاح",
                  isError: false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
