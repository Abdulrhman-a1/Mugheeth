import 'package:flutter/material.dart';
import 'package:graduation/common/theme/colors.dart';
import 'package:graduation/common/widget/layout/screen.dart';
import 'package:graduation/features/chat/ui/widgets/chat_bar.dart';
import 'package:graduation/features/chat/ui/widgets/input_field.dart';
import 'package:graduation/features/chat/ui/widgets/messages.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<String> _messages = [];

  void _sendMessage(String message) {
    setState(() {
      _messages.add(message);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Screen(
      backgroundColor: AppColors.chatScreenGrey,
      child: Column(
        children: [
          ChatBar(),
          ChatMessages(
            messages: _messages,
            onSuggestionSelected: (String) {
              _sendMessage(String);
            },
          ),
          ChatInputField(onSend: _sendMessage),
        ],
      ),
    );
  }
}
