import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graduation/common/widget/pop_up/record_popUp.dart';

class ChatInputField extends StatefulWidget {
  final Function(String) onSend;

  const ChatInputField({super.key, required this.onSend});

  @override
  State<ChatInputField> createState() => _ChatInputFieldState();
}

class _ChatInputFieldState extends State<ChatInputField> {
  final TextEditingController _controller = TextEditingController();

  void sendUserMessage() {
    if (_controller.text.isNotEmpty) {
      widget.onSend(_controller.text);
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.sp),
      padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 10.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              maxLines: null,
              decoration: const InputDecoration(
                hintText: 'وش تشكي منه؟',
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 12),
              ),
              textInputAction: TextInputAction.send,
              onSubmitted: (text) {
                sendUserMessage();
              },
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            icon: Hero(
              tag: 'microphoneHero',
              child: Image.asset(
                'assets/icons/microphone.png',
                width: 24.sp,
                height: 24.sp,
              ),
            ),
            onPressed: () {
              showRecordingScreen(context);
            },
          ),
          IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            icon: SvgPicture.asset(
              'assets/icons/send.svg',
              width: 24.sp,
              height: 24.sp,
            ),
            onPressed: sendUserMessage,
          ),
        ],
      ),
    );
  }
}
