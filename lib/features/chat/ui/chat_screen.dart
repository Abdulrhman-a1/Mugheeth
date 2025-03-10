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
  List<String> _messages = [];

  void _sendMessage(String message) {
    setState(() {
      _messages.add(message);
    });
  }

  void _clearMessages() {
    setState(() {
      _messages = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Screen(
      backgroundColor: AppColors.chatScreenGrey,
      onClearMessages: () {
        _clearMessages();
      },
      child: Column(
        children: [
          ChatBar(onClearMessages: _clearMessages),
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
