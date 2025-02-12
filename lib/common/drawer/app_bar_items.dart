import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/common/drawer/app_siderbar.dart';
import 'package:graduation/common/helper/extensions.dart';
import 'package:graduation/common/theme/colors.dart';
import 'package:graduation/common/widget/buttons/new_chat.dart';
import 'package:graduation/common/widget/pop_up/faq.dart';
import 'package:iconsax/iconsax.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

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
                    showModalBottomSheet(
                      backgroundColor: AppColors.chatScreenGrey,
                      context: context,
                      isScrollControlled: true,
                      builder: (BuildContext context) {
                        return Padding(
                          padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom,
                          ),
                          child: const FaqBottomSheet(),
                        );
                      },
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
