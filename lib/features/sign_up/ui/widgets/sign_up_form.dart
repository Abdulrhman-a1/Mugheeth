import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/features/login/ui/widget/regix.dart';
import 'package:graduation/common/widget/buttons/app_button.dart';
import 'package:graduation/common/widget/custom_shape/text_and_icon.dart';
import 'package:graduation/common/widget/fields/app_textfield.dart';
import 'package:graduation/data/auth/bloc/auth_bloc.dart';
import 'package:graduation/data/auth/bloc/auth_event.dart';
import 'package:graduation/features/sign_up/ui/widgets/pass_validator.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../common/widget/fields/DatePickerField.dart';
import '../../../../common/widget/fields/GenderPickerButton.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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

  final FocusNode passwordFocusNode = FocusNode();
  bool isPasswordFocused = false;
  final FocusNode confirmPasswordFocusNode = FocusNode();
  bool isConfirmPasswordFocused = false;

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
    confirmPasswordController.addListener(_validatePassword);

    passwordFocusNode.addListener(() {
      setState(() {
        isPasswordFocused = passwordFocusNode.hasFocus;
      });
    });

    confirmPasswordFocusNode.addListener(() {
      setState(() {
        isConfirmPasswordFocused = confirmPasswordFocusNode.hasFocus;
      });
    });
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
    confirmPasswordController.removeListener(_validatePassword);
    passwordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

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
                  hintText: loc.first_name,
                  suffixIcon: const Icon(Iconsax.profile_add),
                  validator: (value) {
                    if (fieldErrors['firstName'] != null) {
                      return fieldErrors['firstName'];
                    }
                    if (value == null || value.isEmpty) {
                      return loc.firstname_empty;
                    }
                    if (!AppRegex.isValidName(value)) {
                      return loc.invalid_name;
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
                  hintText: loc.last_name,
                  validator: (value) {
                    if (fieldErrors['lastName'] != null) {
                      return fieldErrors['lastName'];
                    }
                    if (value == null || value.isEmpty) {
                      return loc.lastname_empty;
                    }
                    if (!AppRegex.isValidName(value)) {
                      return loc.invalid_last_name;
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
            hintText: loc.gender,
            validator: (value) =>
                fieldErrors['gender'] ??
                (value.isEmpty ? loc.gender_empty : null),
          ),
          SizedBox(height: 20.h),
          DatePickerField(
            controller: birthDateController,
            hintText: loc.birth_date,
            validator: (value) =>
                fieldErrors['birthDate'] ??
                (value.isEmpty ? loc.bdate_empty : null),
          ),
          SizedBox(height: 20.h),
          AppTextFormField(
            isEmailAndPassword: false,
            controller: emailController,
            suffixIcon: const Icon(Iconsax.direct_inbox),
            hintText: loc.email,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return loc.email_empty;
              }
              if (!AppRegex.isEmailValid(value)) {
                return loc.email_empty;
              }
              return fieldErrors['email'];
            },
          ),
          SizedBox(height: 20.h),
          AppTextFormField(
            isEmailAndPassword: true,
            controller: passwordController,
            hintText: loc.password,
            isObscureText: isPasswordObscureText,
            focusNode: passwordFocusNode,
            validator: (value) =>
                fieldErrors['password'] ??
                (value == null || value.isEmpty ? loc.pass_empty : null),
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isPasswordObscureText = !isPasswordObscureText;
                });
              },
              child: Icon(
                isPasswordObscureText ? Iconsax.eye_slash : Iconsax.eye,
              ),
            ),
          ),
          SizedBox(height: 20.h),
          AppTextFormField(
            isEmailAndPassword: true,
            controller: confirmPasswordController,
            hintText: loc.password_confirom,
            isObscureText: isPasswordConfirmationObscureText,
            focusNode: confirmPasswordFocusNode,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return loc.pass_empty;
              }
              if (value != passwordController.text) {
                return loc.unmatch_pass;
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
                    ? Iconsax.eye_slash
                    : Iconsax.eye,
              ),
            ),
          ),
          SizedBox(height: 10.h),
          if (isPasswordFocused || isConfirmPasswordFocused)
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
            text: loc.register_button,
          ),
          SizedBox(height: 20.h),
          TextAndIcon(
            isShadowNeeded: false,
            iconPath: "assets/icons/lock.png",
            label: loc.policy,
            description: loc.policy_desc,
            onPressed: () async {
              const url = 'https://waelalessa21.github.io/GP_website/';
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw 'Could not launch $url';
              }
            },
          ),
        ],
      ),
    );
  }
}
