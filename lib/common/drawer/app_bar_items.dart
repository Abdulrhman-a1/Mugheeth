import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/common/drawer/app_siderbar.dart';
import 'package:graduation/common/helper/extensions.dart';
import 'package:graduation/common/widget/buttons/new_chat.dart';
import 'package:graduation/common/widget/custom_shape/faq_list.dart';
import 'package:graduation/common/widget/custom_shape/text_and_icon.dart';
import 'package:graduation/common/widget/pop_up/drawer_item_bottom_sheet.dart';
import 'package:graduation/features/history/ui/history_screen.dart';
import 'package:iconsax/iconsax.dart';

class SideBar extends StatelessWidget {
  final bool? isSmall;
  const SideBar({super.key, this.isSmall});

//all items of the drawer will be opend as bottom sheet
  void openDrawerBottomSheet(
      BuildContext context, Widget? title, Widget content,
      {required bool isSmall}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return DrawerItemBottomSheet(
          isSmall: isSmall,
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

  @override
  Widget build(BuildContext context) {
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
                  text: 'المحادثة',
                  icon: Iconsax.message,
                  onPressed: () {
                    context.pop();
                  },
                ),
                AppSiderbar(
                  text: 'السجل الطبي',
                  icon: Iconsax.folder,
                  onPressed: () {
                    context.pop();
                    openDrawerBottomSheet(
                      isSmall: true,
                      context,
                      null,
                      const HistoryScreen(),
                    );
                  },
                ),
                AppSiderbar(
                  text: 'التقييم',
                  icon: Iconsax.star,
                  onPressed: () {
                    context.pop();
                  },
                ),
                AppSiderbar(
                  text: "الاسئلة الشائعة",
                  icon: Iconsax.message_question,
                  onPressed: () {
                    context.pop();
                    openDrawerBottomSheet(
                      isSmall: false,
                      context,
                      TextAndIcon(
                          iconPath: "assets/icons/faq.png",
                          label: "الاسئلة الشائعة",
                          description: "وش حاب تعرف عن مغيث؟",
                          onPressed: () {}),
                      const FaqList(),
                    );
                  },
                ),
                AppSiderbar(
                  text: 'الاعدادات',
                  icon: Iconsax.setting_2,
                  onPressed: () {
                    context.pop();
                    context.pushNamed("/profile");
                  },
                ),
              ],
            ),
            Column(
              children: [
                const NewChatButton(),
                const Divider(color: Colors.grey, thickness: 0.2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        context.pop();
                      },
                      icon: const Icon(Iconsax.login),
                      color: Colors.black,
                      iconSize: 20.sp,
                    ),
                    Text(
                      "وائل",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
