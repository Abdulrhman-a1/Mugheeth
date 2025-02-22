import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/common/helper/extensions.dart';
import 'package:graduation/common/widget/buttons/show_chat_button.dart';
import 'package:graduation/common/widget/custom_shape/text_and_icon.dart';
import 'package:graduation/features/history/ui/widgets/empty_history.dart';
import 'package:graduation/features/history/ui/widgets/list_cards.dart';

class HistoryScreen extends StatefulWidget {
  HistoryScreen({super.key});

  @override
  HistoryScreenState createState() => HistoryScreenState();
}

class HistoryScreenState extends State<HistoryScreen> {
  double _opacity = 0.0;
  bool isEmpty = false; //this will be removed when we have users with data.

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      setState(() {
        _opacity = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TextAndIcon(
            iconPath: "assets/icons/history.png",
            label: "سجلاتك الطبية",
            description: "الان بإمكانك الحصول على سجلك الطبي من مُغيث",
            onPressed: () {},
          ),
          SizedBox(height: 20.h),
          isEmpty ? EmptyHistory() : MedicalHistoryCards(),
          SizedBox(height: 20.h),
          AnimatedOpacity(
            opacity: _opacity,
            duration: const Duration(seconds: 10),
            child: ShowChatButton(
              text: isEmpty ? "ابدا محادثة جديدة" : "عرض المزيد",
              onPressed: () {
                context.pop();
              },
            ),
          ),
        ],
      ),
    );
  }
}
