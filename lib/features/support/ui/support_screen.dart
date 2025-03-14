import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/common/widget/custom_shape/text_and_icon.dart';
import 'package:graduation/features/support/ui/widget/complain.dart';
import 'package:lottie/lottie.dart';

class Support extends StatelessWidget {
  const Support({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return SingleChildScrollView(
      child: Column(
        children: [
          TextAndIcon(
            iconPath: "assets/icons/request.png",
            label: loc.contact_us,
            description: loc.contact_us_description,
            onPressed: () {},
          ),
          Lottie.asset(
            'assets/lottie/chat.json',
            width: double.infinity,
            height: 170.0.sp,
          ),
          Complain()
        ],
      ),
    );
  }
}
