import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/common/theme/colors.dart';
import 'package:graduation/common/widget/custom_shape/text_and_icon.dart';
import 'package:graduation/common/widget/fields/DatePickerField.dart';
import 'package:graduation/common/widget/fields/GenderPickerButton.dart';
import 'package:graduation/common/widget/fields/app_textfield.dart';
import 'package:graduation/data/auth/service/auth_service.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../common/theme/text_style.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  _UserInfoState createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  final AuthService authService = AuthService();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final FocusNode nameFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode birthDateFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  bool isEditing = false;
  String? editingField;

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    final userData = await authService.getUserData();

    if (userData != null) {
      setState(() {
        nameController.text = userData['name'] ?? "";
        emailController.text = userData['email'] ?? "";
        birthDateController.text = userData['bdate'] ?? "";
        genderController.text = userData['gender'] ?? "";
        passwordController.text = "";
      });
    }
  }

  Future<void> _saveUserData() async {
    await authService.updateUserData({
      'name': nameController.text,
      'email': emailController.text,
      'bdate': birthDateController.text,
      'gender': genderController.text,
    });

    if (passwordController.text.isNotEmpty) {
      await authService.editUserPassword(passwordController.text);
    }

    setState(() {
      isEditing = false;
      editingField = null;
    });

    _fetchUserData();
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.sp, vertical: 24.sp),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextAndIcon(
                iconPath: "assets/icons/setting-lines.png",
                label: loc.settings_title,
                description: loc.settings_description,
                onPressed: () {
                  setState(() {
                    isEditing = !isEditing;
                    editingField = null;
                  });
                },
              ),
              // edit image
              TextAndIcon(
                iconPath: "assets/icons/editing.png",
                label: "",
                description: "",
                onPressed: () {
                  setState(() {
                    isEditing = !isEditing;
                    editingField = null;
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 8,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: Column(
              children: [
                editableInfoContent(
                  loc.name,
                  nameController,
                  Iconsax.note_add,
                  'name',
                  focusNode: nameFocusNode,
                ),
                Divider(color: AppColors.mainAppGrey.withOpacity(0.2)),
                editableInfoContent(
                  loc.email,
                  emailController,
                  Iconsax.direct_inbox,
                  'email',
                  focusNode: emailFocusNode,
                ),
                Divider(color: AppColors.mainAppGrey.withOpacity(0.2)),
                editableInfoContent(
                  loc.birth_date,
                  birthDateController,
                  Iconsax.calendar,
                  'bdate',
                  focusNode: birthDateFocusNode,
                  isDate: true,
                ),
                Divider(color: AppColors.mainAppGrey.withOpacity(0.2)),
                editableInfoContent(
                  loc.gender,
                  genderController,
                  Iconsax.user,
                  'gender',
                  isGender: true,
                ),
                Divider(color: AppColors.mainAppGrey.withOpacity(0.2)),
                editableInfoContent(
                  loc.password,
                  passwordController,
                  Iconsax.code,
                  'password',
                  obscureText: true,
                  isPassword: true,
                  focusNode: passwordFocusNode,
                ),
              ],
            ),
          ),
          if (isEditing)
            Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.width * 0.15,
                  child: TextButton(
                    onPressed: () {
                      _saveUserData();
                    },
                    style: ButtonStyle(
                      overlayColor:
                          const WidgetStatePropertyAll(Colors.transparent),
                      backgroundColor: const WidgetStatePropertyAll(
                        Color.fromARGB(255, 218, 230, 252),
                      ),
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.sp),
                        ),
                      ),
                      textStyle: WidgetStatePropertyAll(
                        TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      padding: WidgetStatePropertyAll(
                        EdgeInsets.symmetric(horizontal: 16.w),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: 5.w),
                        Text(
                          loc.save,
                          style: TextStyles.onboardingDesc.copyWith(
                            color: Colors.blue,
                            fontFamily: loc.localeName == 'ar'
                                ? 'IBMPlexSansArabic'
                                : 'share',
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
        ],
      ),
    );
  }

  Widget editableInfoContent(
    String label,
    TextEditingController controller,
    IconData icon,
    String fieldKey, {
    bool obscureText = false,
    bool isPassword = false,
    bool isGender = false,
    bool isDate = false,
    FocusNode? focusNode,
  }) {
    return GestureDetector(
      onTap: () {
        if (isEditing) {
          setState(() {
            editingField = fieldKey;
          });
          focusNode?.requestFocus();
        }
      },
      child: Padding(
        padding: EdgeInsets.all(16.0.sp),
        child: Row(
          children: [
            Icon(icon, color: AppColors.mainSoftBlue),
            SizedBox(width: 16.w),
            Expanded(
              child: editingField == fieldKey
                  ? (isGender
                      ? GenderPickerField(
                          controller: controller,
                          hintText: label,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'الرجاء اختيار الجنس';
                            }
                            return null;
                          },
                        )
                      : (isDate
                          ? DatePickerField(
                              controller: controller,
                              hintText: 'تاريخ الميلاد',
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'الرجاء اختيار تاريخ الميلاد';
                                }
                                return null;
                              },
                            )
                          : AppTextFormField(
                              controller: controller,
                              focusNode: focusNode,
                              hintText: '',
                              validator: (String) {
                                return null;
                              },
                            )))
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          label,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.mainAppColor,
                            fontSize: 14.sp,
                          ),
                        ),
                        AnimatedOpacity(
                          duration: const Duration(milliseconds: 300),
                          opacity: controller.text.isEmpty ? 0.0 : 1.0,
                          child: Text(
                            isPassword && controller.text.isEmpty
                                ? "********"
                                : controller.text.isEmpty
                                    ? ''
                                    : controller.text,
                            style: TextStyle(
                              color: isEditing ? Colors.blue : Colors.black,
                              fontFamily: "IBMPlexSansArabic",
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
