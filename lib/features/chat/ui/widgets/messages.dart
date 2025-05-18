import 'package:flutter/material.dart';
import 'package:graduation/features/chat/ui/widgets/message_container.dart';
import 'package:graduation/features/chat/ui/widgets/no_chat.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChatMessages extends StatelessWidget {
  final List<Map<String, String>> messages;
  final bool isLoading;
  final Function(String) onSuggestionSelected;
  final ScrollController scrollController;

  const ChatMessages({
    super.key,
    required this.messages,
    required this.onSuggestionSelected,
    required this.scrollController,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final isArabic = loc.localeName == "ar";

    if (messages.isEmpty) {
      return NoChat(onSuggestionSelected: onSuggestionSelected);
    }

    return ListView.builder(
      controller: scrollController,
      padding: const EdgeInsets.symmetric(vertical: 16),
      itemCount: messages.length + (isLoading ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == messages.length && isLoading) {
          return Align(
            key: ValueKey('loading_$index'),
            alignment: isArabic ? Alignment.centerRight : Alignment.centerLeft,
            child: MessageContainer(
              key: ValueKey('msg_loading_$index'),
              isUser: false,
              isLoading: true,
              content: '',
              index: index,
            ),
          );
        }

        final message = messages[index];
        final isUser = message['role'] == 'user';
        final content = message['content'] ?? '';

        final alignment = isUser
            ? (isArabic ? Alignment.centerRight : Alignment.centerLeft)
            : (isArabic ? Alignment.centerLeft : Alignment.centerRight);

        return Align(
          key: ValueKey('msg_$index'),
          alignment: alignment,
          child: MessageContainer(
            key: ValueKey('container_$index'),
            isUser: isUser,
            content: content,
            index: index,
            isLoading: false,
          ),
        );
      },
    );
  }
}
