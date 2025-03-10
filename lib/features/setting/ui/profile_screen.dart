import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/common/theme/colors.dart';
import 'package:graduation/common/widget/custom_shape/app_top_bar.dart';
import 'package:graduation/common/widget/layout/screen.dart';
import 'package:graduation/features/setting/ui/widget/delete_button.dart';
import 'package:graduation/features/setting/ui/widget/general_setting.dart';
import 'package:graduation/features/setting/ui/widget/user_info.dart';

///In this user can change his account info and also general settings.
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Screen(
      backgroundColor: AppColors.chatScreenGrey,
      onClearMessages: () {},
      child: SingleChildScrollView(
        child: Column(
          children: [
            const AppTopBar(),
            const UserInfo(),
            const GeneralSetting(),
            const DeleteButton(),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
