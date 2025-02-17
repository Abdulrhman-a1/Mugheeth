import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/common/theme/colors.dart';
import 'package:graduation/common/theme/text_style.dart';
import 'package:intl/intl.dart';
import 'package:iconsax/iconsax.dart';

class DatePickerField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final Function(String) validator;

  const DatePickerField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.validator,
  }) : super(key: key);

  @override
  _DatePickerFieldState createState() => _DatePickerFieldState();
}

class _DatePickerFieldState extends State<DatePickerField> {
  Future<void> _selectDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      helpText: "اختر التاريخ",
      cancelText: "إلغاء",
      confirmText: "تأكيد",
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: AppColors.mainAppColor, // Header & buttons color
            colorScheme: ColorScheme.light(
              primary: AppColors.mainAppColor, // OK & CANCEL button color
              onPrimary: Colors.white, // Text color on buttons
              onSurface: AppColors.mainAppColor, // Text color for calendar
            ),
            dialogBackgroundColor:
                Colors.white, // Background color of the date picker
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
          suffixIcon: IconButton(
            icon: const Icon(Iconsax.calendar),
            onPressed: _selectDate,
          ),
          fillColor: Colors.white,
          filled: true,
        ),
        validator: (value) => widget.validator(value!),
      ),
    );
  }
}
