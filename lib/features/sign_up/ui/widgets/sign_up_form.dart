import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/common/widget/buttons/app_button.dart';
import 'package:graduation/common/widget/custom_shape/text_and_icon.dart';
import 'package:graduation/common/widget/fields/app_textfield.dart';
import 'package:graduation/data/auth/bloc/auth_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/widget/fields/DatePickerField.dart';
import '../../../../common/widget/fields/GenderPickerButton.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  // Store field errors
  Map<String, String> fieldErrors = {};

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: AppTextFormField(
                  controller: firstNameController,
                  hintText: "الاسم الأول",
                  suffixIcon: const Icon(Iconsax.profile_add),
                  validator: (value) =>
                      fieldErrors['firstName'] ??
                      (value == null || value.isEmpty
                          ? 'الرجاء إدخال الاسم الأول'
                          : null),
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: AppTextFormField(
                  controller: lastNameController,
                  suffixIcon: const Icon(Iconsax.user),
                  hintText: "الاسم الأخير",
                  validator: (value) =>
                      fieldErrors['lastName'] ??
                      (value == null || value.isEmpty
                          ? 'الرجاء إدخال الاسم الأخير'
                          : null),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),

          // Gender Picker Field
          GenderPickerField(
            controller: genderController,
            hintText: "الجنس",
            validator: (value) =>
                fieldErrors['gender'] ??
                (value == null || value.isEmpty ? 'الرجاء اختيار الجنس' : null),
          ),
          SizedBox(height: 20.h),

          // Date of Birth Field
          DatePickerField(
            controller: birthDateController,
            hintText: "تاريخ الميلاد",
            validator: (value) =>
                fieldErrors['birthDate'] ??
                (value == null || value.isEmpty
                    ? 'الرجاء إدخال تاريخ الميلاد'
                    : null),
          ),
          SizedBox(height: 20.h),

          // Email Field
          AppTextFormField(
            controller: emailController,
            suffixIcon: const Icon(Iconsax.direct_inbox),
            hintText: "البريد الإلكتروني",
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'الرجاء إدخال البريد الإلكتروني';
              }
              final emailRegex =
                  RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
              if (!emailRegex.hasMatch(value)) {
                return 'الرجاء إدخال بريد إلكتروني صالح';
              }
              return fieldErrors['email'];
            },
          ),
          SizedBox(height: 20.h),

          // Password Field
          AppTextFormField(
            controller: passwordController,
            suffixIcon: const Icon(Iconsax.lock),
            hintText: "كلمة المرور",
            isObscureText: true,
            validator: (value) =>
                fieldErrors['password'] ??
                (value == null || value.isEmpty
                    ? 'الرجاء إدخال كلمة المرور'
                    : null),
          ),
          SizedBox(height: 20.h),

          // Confirm Password Field
          AppTextFormField(
            controller: confirmPasswordController,
            suffixIcon: const Icon(Iconsax.lock_circle4),
            hintText: "تأكيد كلمة المرور",
            isObscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'الرجاء تأكيد كلمة المرور';
              }
              if (value != passwordController.text) {
                return 'كلمتا المرور غير متطابقتين';
              }
              return fieldErrors['confirmPassword'];
            },
          ),
          SizedBox(height: 20.h),

          // Sign Up Button
          AppButton(
            press: () {
              setState(() {
                fieldErrors.clear();
              });

              if (_formKey.currentState!.validate()) {
                context.read<AuthBloc>().add(
                      AuthSignUp(
                        email: emailController.text,
                        password: passwordController.text,
                        name:
                            '${firstNameController.text} ${lastNameController.text}',
                        Bdata: birthDateController.text,
                        gender: genderController.text,
                      ),
                    );
              }
            },
            text: 'إنشاء حساب',
          ),
          SizedBox(height: 20.h),

          // Privacy Policy
          TextAndIcon(
            iconPath: "assets/icons/lock.png",
            label: "سياسة الخصوصية",
            description: "بمجرد تفعيلك للحساب فأنت توافق على سياسة الخصوصية",
            onPressed: () {
              // فتح سياسة الخصوصية
            },
          ),
        ],
      ),
    );
  }
}
