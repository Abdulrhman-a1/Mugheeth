import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/common/routing/routes.dart';
import 'package:graduation/common/widget/drawer/app_siderbar.dart';
import 'package:graduation/common/routing/extensions.dart';
// import 'package:graduation/common/widget/buttons/new_chat.dart';
import 'package:graduation/common/widget/custom_shape/faq_list.dart';
import 'package:graduation/common/widget/custom_shape/text_and_icon.dart';
import 'package:graduation/common/widget/pop_up/drawer_item_bottom_sheet.dart';
import 'package:graduation/data/auth/bloc/auth_bloc.dart';
import 'package:graduation/data/auth/bloc/auth_event.dart' show AuthSignOut;
import 'package:graduation/features/chat/ui/widgets/chat_bar.dart';
import 'package:graduation/features/feedback/ui/feedback_screen.dart';
import 'package:graduation/features/history/ui/history_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SideBar extends StatelessWidget {
  final bool? isSmall;
  final Function? onNewChat;
  final VoidCallback onClearMessages;

  const SideBar({
    super.key,
    this.isSmall,
    this.onNewChat,
    required this.onClearMessages,
  });

  void openDrawerBottomSheet(
      BuildContext context, Widget? title, Widget content,
      {required bool isSmall}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: DrawerItemBottomSheet(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                title ?? const SizedBox.shrink(),
                SizedBox(height: 16.sp),
                content,
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Drawer(
      backgroundColor: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 64.sp, horizontal: 16.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                AppSiderbar(
                  text: loc.chat,
                  icon: Iconsax.message,
                  onPressed: () {
                    context.pop();
                  },
                ),
                AppSiderbar(
                  text: loc.history,
                  icon: Iconsax.folder,
                  onPressed: () {
                    context.pop();
                    openDrawerBottomSheet(
                      isSmall: false,
                      context,
                      null,
                      HistoryScreen(),
                    );
                  },
                ),
                AppSiderbar(
                  text: loc.feedback,
                  icon: Iconsax.star,
                  onPressed: () {
                    context.pop();
                    openDrawerBottomSheet(
                      isSmall: true,
                      context,
                      null,
                      const FeedbackScreen(),
                    );
                  },
                ),
                AppSiderbar(
                  text: loc.faq,
                  icon: Iconsax.message_question,
                  onPressed: () {
                    context.pop();
                    openDrawerBottomSheet(
                      isSmall: false,
                      context,
                      TextAndIcon(
                        iconPath: "assets/icons/faq.png",
                        label: loc.faq_title,
                        description: loc.faq_description,
                        onPressed: () {},
                      ),
                      const FaqList(),
                    );
                  },
                ),
                AppSiderbar(
                  text: loc.settings,
                  icon: Iconsax.setting_2,
                  onPressed: () {
                    context.pop();
                    context.pushNamed("/profile");
                  },
                ),
                AppSiderbar(
                  text: loc.policy,
                  icon: Iconsax.chart,
                  onPressed: () async {
                    const url = 'https://waelalessa21.github.io/GP_website/';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                    context.pop();
                  },
                ),
                AppSiderbar(
                  text: loc.logout,
                  icon: Iconsax.logout,
                  onPressed: () {
                    context.read<AuthBloc>().add(AuthSignOut());
                    context.pushReplacementNamed(Routes.onBoarding);
                  },
                ),
              ],
            ),
            Column(
              children: [
                // NewChatButton(
                //   onNewChat: () {
                //     onClearMessages();
                //   },
                // ),
                SizedBox(height: 16.h),
                const Divider(color: Colors.grey, thickness: 0.2),
                SizedBox(height: 16.h),
                Text(
                  "$username 🚀 ",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.sp,
                    fontFamily: "IBMPlexSansArabic",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
