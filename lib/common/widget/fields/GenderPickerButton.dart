import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/common/theme/colors.dart';
import 'package:graduation/common/theme/text_style.dart';
import 'package:iconsax/iconsax.dart';

class GenderPickerField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final Function(String) validator;

  const GenderPickerField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.validator,
  }) : super(key: key);

  @override
  _GenderPickerFieldState createState() => _GenderPickerFieldState();
}

class _GenderPickerFieldState extends State<GenderPickerField> {
  void _showGenderPicker() {
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      // 💻 iOS - Cupertino Action Sheet
      showCupertinoModalPopup(
        context: context,
        builder: (BuildContext context) => CupertinoActionSheet(
          title: const Text("اختر الجنس"),
          actions: [
            CupertinoActionSheetAction(
              onPressed: () => _selectGender("ذكر"),
              child: const Text("ذكر"),
            ),
            CupertinoActionSheetAction(
              onPressed: () => _selectGender("أنثى"),
              child: const Text("أنثى"),
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            onPressed: () => Navigator.pop(context),
            child: const Text("إلغاء", style: TextStyle(color: Colors.red)),
          ),
        ),
      );
    } else {
      // 🤖 Android - Bottom Sheet
      showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
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
                  "اختر الجنس",
                  style: TextStyles.hintTextLogin.copyWith(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.mainAppColor,
                  ),
                ),
                const SizedBox(height: 10),

                // زر اختيار "ذكر"
                _buildGenderOption("ذكر"),

                const SizedBox(height: 10),

                // زر اختيار "أنثى"
                _buildGenderOption("أنثى"),

                const SizedBox(height: 10),

                // زر إغلاق النافذة
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    "إلغاء",
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
    return TextFormField(
      controller: widget.controller,
      readOnly: true,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 18.h),
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
        suffixIcon: IconButton(
          icon: const Icon(Iconsax.emoji_normal),
          onPressed: _showGenderPicker,
        ),
        fillColor: Colors.white,
        filled: true,
      ),
      validator: (value) => widget.validator(value!),
    );
  }
}
