import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/common/theme/colors.dart';
import 'package:graduation/common/theme/text_style.dart';
import 'package:graduation/common/widget/buttons/chat_button.dart';
import 'package:graduation/common/widget/custom_shape/app_container.dart';
import 'package:graduation/common/widget/pop_up/mugheeth_popup.dart';
import 'package:graduation/features/login/ui/login.dart';
import '../../../../data/auth/service/auth_service.dart';

String username = "";

/// Chat bar; show app name and burger menu.
class ChatBar extends StatefulWidget {
  ChatBar({
    super.key,
  });
  @override
  State<ChatBar> createState() => _ChatBarState();
}

class _ChatBarState extends State<ChatBar> {
  final AuthService authService = AuthService();

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
            child: AppContainer(
              color: AppColors.mainSoftBlue.withOpacity(0.3),
              textColor: AppColors.mainSoftBlue,
              label: 'مغيث',
              onPressed: () {
                showMugheeth(context);
              },
              raduis: 10,
            ),
          ),
          actions: [
            ValueListenableBuilder<String?>(
              valueListenable: authService.userNameNotifier,
              builder: (context, userName, _) {
                if (userName != null && userName.isNotEmpty) {
                  username = userName;
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Center(
                      child: Text(
                        'مرحبًا، $userName',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.mainAppColor,
                        ),
                      ),
                    ),
                  );
                } else {
                  return ChatButton(
                    text: 'تسجيل الدخول',
                    onPressed: () {
                      showLoginDialog(
                          context,
                          () => setState(() {
                                print('login');
                              }));
                    },
                  );
                }
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
        // Simple text to show the time of device.
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: Text(
            ' ${TimeOfDay.now().format(context)}',
            style: TextStyles.timeText,
          ),
        ),
      ],
    );
  }
}
