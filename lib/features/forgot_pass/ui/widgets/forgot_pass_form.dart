import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/common/widget/fields/app_textfield.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// Form where the user will be able to reset their password.
class ForgotPassForm extends StatelessWidget {
  final TextEditingController controller;

  ForgotPassForm({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppTextFormField(
          controller: controller,
          suffixIcon: const Icon(Iconsax.direct_inbox),
          hintText: loc.email,
          validator: (value) {
            if (value!.isEmpty) {
              return loc.email_empty;
            }
            return null;
          },
        ),
        SizedBox(height: 25.h),
      ],
    );
  }
}
