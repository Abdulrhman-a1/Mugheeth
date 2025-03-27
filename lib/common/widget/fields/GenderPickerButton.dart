import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/common/theme/colors.dart';
import 'package:graduation/common/theme/text_style.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GenderPickerField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final Function(String) validator;

  const GenderPickerField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.validator,
  });

  @override
  GenderPickerFieldState createState() => GenderPickerFieldState();
}

class GenderPickerFieldState extends State<GenderPickerField> {
  void _showGenderPicker() {
    final loc = AppLocalizations.of(context)!;

    if (Theme.of(context).platform == TargetPlatform.iOS) {
      showCupertinoModalPopup(
        context: context,
        builder: (BuildContext context) => CupertinoActionSheet(
          title: Text(loc.gender),
          actions: [
            CupertinoActionSheetAction(
              onPressed: () => _selectGender(loc.boy),
              child: Text(loc.boy),
            ),
            CupertinoActionSheetAction(
              onPressed: () => _selectGender(loc.girl),
              child: Text(loc.girl),
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            onPressed: () => Navigator.pop(context),
            child: Text(loc.cancel, style: TextStyle(color: Colors.red)),
          ),
        ),
      );
    } else {
      showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        backgroundColor: Colors.white,
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  loc.gender,
                  style: TextStyles.hintTextLogin.copyWith(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.mainAppColor,
                  ),
                ),
                const SizedBox(height: 10),
                _buildGenderOption(loc.boy),
                const SizedBox(height: 10),
                _buildGenderOption(loc.girl),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    loc.cancel,
                    style: TextStyles.hintTextLogin.copyWith(
                      fontSize: 16.sp,
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    }
  }

  void _selectGender(String gender) {
    setState(() {
      widget.controller.text = gender;
    });
    Navigator.pop(context);
  }

  Widget _buildGenderOption(String gender) {
    return GestureDetector(
      onTap: () => _selectGender(gender),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 15.h),
        decoration: BoxDecoration(
          color: AppColors.mainSoftBlue.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.mainAppColor, width: 1.3),
        ),
        child: Center(
          child: Text(
            gender,
            style: TextStyles.hintTextLogin.copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.mainAppColor,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _showGenderPicker,
      child: AbsorbPointer(
        child: TextFormField(
          controller: widget.controller,
          readOnly: true,
          decoration: InputDecoration(
            isDense: true,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 12.w, vertical: 18.h),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColors.mainAppColor,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColors.mainSoftBlue,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.red,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.red,
                width: 1.3,
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
            hintText: widget.hintText,
            hintStyle: TextStyles.hintTextLogin,
            suffixIcon: const Icon(Iconsax.emoji_normal),
            fillColor: Colors.white,
            filled: true,
          ),
          validator: (value) => widget.validator(value!),
        ),
      ),
    );
  }
}
