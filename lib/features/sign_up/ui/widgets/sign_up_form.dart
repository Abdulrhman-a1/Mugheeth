import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/common/helper/regix.dart';
import 'package:graduation/common/widget/buttons/app_button.dart';
import 'package:graduation/common/widget/custom_shape/text_and_icon.dart';
import 'package:graduation/common/widget/fields/app_textfield.dart';
import 'package:graduation/data/auth/bloc/auth_bloc.dart';
import 'package:graduation/features/sign_up/ui/widgets/pass_validator.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/widget/fields/DatePickerField.dart';
import '../../../../common/widget/fields/GenderPickerButton.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  SignUpFormState createState() => SignUpFormState();
}

class SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool isPasswordObscureText = true;
  bool isPasswordConfirmationObscureText = true;

  Map<String, String> fieldErrors = {};

  @override
  void initState() {
    super.initState();
    passwordController.addListener(_validatePassword);
  }

  void _validatePassword() {
    setState(() {
      hasLowercase = AppRegex.hasLowerCase(passwordController.text);
      hasUppercase = AppRegex.hasUpperCase(passwordController.text);
      hasNumber = AppRegex.hasNumber(passwordController.text);
      hasSpecialCharacters =
          AppRegex.hasSpecialCharacter(passwordController.text);
      hasMinLength = AppRegex.hasMinLength(passwordController.text);
    });
  }

  @override
  void dispose() {
    passwordController.removeListener(_validatePassword);
    super.dispose();
  }

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
                  validator: (value) {
                    if (fieldErrors['firstName'] != null) {
                      return fieldErrors['firstName'];
                    }
                    if (value == null || value.isEmpty) {
                      return 'الرجاء إدخال الاسم الأول';
                    }
                    if (!AppRegex.isValidName(value)) {
                      return 'ادخل اسمك بشكل صحيح';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: AppTextFormField(
                  controller: lastNameController,
                  suffixIcon: const Icon(Iconsax.user),
                  hintText: "الاسم الأخير",
                  validator: (value) {
                    if (fieldErrors['lastName'] != null) {
                      return fieldErrors['lastName'];
                    }
                    if (value == null || value.isEmpty) {
                      return 'الرجاء إدخال الاسم الأخير';
                    }
                    if (!AppRegex.isValidName(value)) {
                      return 'ادخل اسمك بشكل صحيح';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          GenderPickerField(
            controller: genderController,
            hintText: "الجنس",
            validator: (value) =>
                fieldErrors['gender'] ??
                (value.isEmpty ? 'الرجاء اختيار الجنس' : null),
          ),
          SizedBox(height: 20.h),
          DatePickerField(
            controller: birthDateController,
            hintText: "تاريخ الميلاد",
            validator: (value) =>
                fieldErrors['birthDate'] ??
                (value.isEmpty ? 'الرجاء إدخال تاريخ الميلاد' : null),
          ),
          SizedBox(height: 20.h),
          AppTextFormField(
            isEmailAndPassword: true,
            controller: emailController,
            suffixIcon: const Icon(Iconsax.direct_inbox),
            hintText: "البريد الإلكتروني",
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'الرجاء إدخال البريد الإلكتروني';
              }
              if (!AppRegex.isEmailValid(value)) {
                return 'الرجاء إدخال بريد إلكتروني صالح';
              }
              return fieldErrors['email'];
            },
          ),
          SizedBox(height: 20.h),
          AppTextFormField(
            isEmailAndPassword: true,
            controller: passwordController,
            hintText: "كلمة المرور",
            isObscureText: isPasswordObscureText,
            validator: (value) =>
                fieldErrors['password'] ??
                (value == null || value.isEmpty
                    ? 'الرجاء إدخال كلمة المرور'
                    : null),
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isPasswordObscureText = !isPasswordObscureText;
                });
              },
              child: Icon(
                isPasswordObscureText ? Icons.visibility_off : Icons.visibility,
              ),
            ),
          ),
          SizedBox(height: 20.h),
          AppTextFormField(
            isEmailAndPassword: true,
            controller: confirmPasswordController,
            hintText: "تأكيد كلمة المرور",
            isObscureText: isPasswordConfirmationObscureText,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'الرجاء تأكيد كلمة المرور';
              }
              if (value != passwordController.text) {
                return 'كلمتا المرور غير متطابقتين';
              }
              return fieldErrors['confirmPassword'];
            },
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isPasswordConfirmationObscureText =
                      !isPasswordConfirmationObscureText;
                });
              },
              child: Icon(
                isPasswordConfirmationObscureText
                    ? Icons.visibility_off
                    : Icons.visibility,
              ),
            ),
          ),
          SizedBox(height: 10.h),
          PasswordValidations(
            hasLowerCase: hasLowercase,
            hasUpperCase: hasUppercase,
            hasSpecialCharacters: hasSpecialCharacters,
            hasNumber: hasNumber,
            hasMinLength: hasMinLength,
          ),
          SizedBox(height: 20.h),
          AppButton(
            isShadowNeeded: false,
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
          TextAndIcon(
            isShadowNeeded: false,
            iconPath: "assets/icons/lock.png",
            label: "سياسة الخصوصية",
            description: "بمجرد تفعيلك للحساب فأنت توافق على سياسة الخصوصية",
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
