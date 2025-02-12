import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/common/widget/custom_shape/chat_suggestion.dart';

/// Empty chat design
class NoChat extends StatefulWidget {
  const NoChat({
    super.key,
  });

  @override
  NoChatState createState() => NoChatState();
}

class NoChatState extends State<NoChat> {
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _opacity = 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AnimatedOpacity(
          opacity: _opacity,
          duration: const Duration(seconds: 10),
          child: FadeInDown(
            child: Image.asset(
              'assets/images/logo.png',
              width: 55.w,
            ),
          ),
        ),
        const ChatSuggestions(),
      ],
    );
  }
}
