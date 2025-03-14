import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/common/theme/colors.dart';
import 'package:graduation/common/theme/text_style.dart';
import 'package:graduation/common/widget/buttons/chat_button.dart';
import 'package:graduation/common/widget/custom_shape/app_container.dart';
import 'package:graduation/common/widget/pop_up/drawer_item_bottom_sheet.dart';
import 'package:graduation/common/widget/pop_up/guest_popup.dart';
import 'package:graduation/common/widget/pop_up/mugheeth_popup.dart';
import 'package:graduation/features/login/ui/login.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../data/auth/service/auth_service.dart';

String username = "";

class ChatBar extends StatefulWidget {
  final VoidCallback onClearMessages;

  ChatBar({
    super.key,
    required this.onClearMessages,
  });

  @override
  State<ChatBar> createState() => _ChatBarState();
}

class _ChatBarState extends State<ChatBar> {
  final AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Column(
      children: [
        AppBar(
          leading: Builder(
            builder: (context) {
              return IconButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                icon: const Icon(Iconsax.menu_1, color: AppColors.mainAppColor),
                onPressed: () {
                  if (authService.userNameNotifier.value != null &&
                      authService.userNameNotifier.value!.isNotEmpty) {
                    Scaffold.of(context).openDrawer();
                  } else {
                    openDrawerBottomSheet(
                      isSmall: true,
                      context,
                      null,
                      const GuestPopup(),
                    );
                  }
                },
              );
            },
          ),
          title: Hero(
            tag: "WhoMugheeth",
            child: AppContainer(
              color: AppColors.mainSoftBlue.withOpacity(0.3),
              textColor: AppColors.mainSoftBlue,
              label: loc.mugheeth,
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
                      child: Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: Text(
                          '$userName',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.mainAppColor,
                            fontFamily: "IBMPlexSansArabic",
                          ),
                        ),
                      ),
                    ),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: ChatButton(
                      text: loc.login,
                      onPressed: () {
                        showLoginDialog(context, () => setState(() {}));
                      },
                    ),
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

void openDrawerBottomSheet(BuildContext context, Widget? title, Widget content,
    {required bool isSmall}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return DrawerItemBottomSheet(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            title ?? SizedBox.shrink(),
            SizedBox(height: 16.sp),
            content,
          ],
        ),
      );
    },
  );
}
