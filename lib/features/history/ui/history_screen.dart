import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/common/widget/custom_shape/text_and_icon.dart';
import 'package:graduation/features/history/ui/widgets/history_card.dart';
import 'package:graduation/features/history/ui/widgets/history_title.dart';
import 'package:graduation/features/history/ui/widgets/show_chat_button.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  HistoryScreenState createState() => HistoryScreenState();
}

class HistoryScreenState extends State<HistoryScreen> {
  double _opacity = 0.0;

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
          const HistoryTitle(),
          SizedBox(height: 30.h),
          const HistoryCard(),
          SizedBox(height: 30.h),
          AnimatedOpacity(
            opacity: _opacity,
            duration: const Duration(seconds: 5),
            child: SizedBox(
              width: 0.4.sw,
              child: ShowChatButton(
                text: "عرض المزيد",
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
