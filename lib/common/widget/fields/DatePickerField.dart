import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/common/theme/colors.dart';
import 'package:graduation/common/theme/text_style.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:iconsax/iconsax.dart';

class DatePickerField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final Function(String) validator;

  const DatePickerField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.validator,
  });

  @override
  DatePickerFieldState createState() => DatePickerFieldState();
}

class DatePickerFieldState extends State<DatePickerField> {
  Future<void> _selectDate() async {
    final loc = AppLocalizations.of(context)!;

    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      helpText: loc.birth_date,
      cancelText: loc.cancel,
      confirmText: loc.sure,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: AppColors.mainAppColor,
            colorScheme: const ColorScheme.light(
              primary: AppColors.mainAppColor,
              onPrimary: Colors.white,
              onSurface: AppColors.mainAppColor,
            ),
            dialogBackgroundColor: Colors.white,
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null && mounted) {
      setState(() {
        widget.controller.text = DateFormat('yyyy-MM-dd').format(pickedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _selectDate,
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
            suffixIcon: const Icon(Iconsax.calendar),
            fillColor: Colors.white,
            filled: true,
          ),
          validator: (value) => widget.validator(value!),
        ),
      ),
    );
  }
}
