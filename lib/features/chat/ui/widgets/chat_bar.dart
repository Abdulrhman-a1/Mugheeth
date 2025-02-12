import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/common/theme/colors.dart';
import 'package:graduation/common/theme/text_style.dart';
import 'package:graduation/common/widget/buttons/chat_button.dart';
import 'package:graduation/common/widget/pop_up/mugheeth_popup.dart';
import 'package:graduation/features/login/ui/login.dart';

/// Chat bar; show app name and burger menu.
class ChatBar extends StatelessWidget {
  const ChatBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          leading: Builder(
            builder: (context) {
              //burger menu icon. we will open a menu to the user inside the chat.
              return IconButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                icon: const Icon(Icons.menu, color: AppColors.mainAppColor),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
          title: Hero(
            tag: "WhoMugheeth",
            child: TextButton(
              onPressed: () {
                showMugheeth(context);
              },
              style: TextButton.styleFrom(
                overlayColor: Colors.transparent,
                backgroundColor: AppColors.mainSoftBlue.withOpacity(0.3),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.sp),
                ),
              ),
              child: Text(
                'مُغيث',
                style: TextStyles.chatAppBarName,
              ),
            ),
          ),
          actions: [
            ChatButton(
              //this might be a login or new chat button.
              text: 'تسجيل الدخول',
              onPressed: () {
                showLoginDialog(context);
              },
            ),
          ],
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: const Divider(
            color: AppColors.mainAppColor,
            thickness: 0.1,
            height: 1,
          ),
        ),
        //Simple text to show the time of device.
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: Text(
            ' ${TimeOfDay.now().format(context)}',
            style: TextStyles.timeText,
          ),
        )
      ],
    );
  }
}
