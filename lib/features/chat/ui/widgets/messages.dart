import 'package:flutter/material.dart';
import 'package:graduation/features/chat/ui/widgets/message_container.dart';
import 'package:graduation/features/chat/ui/widgets/no_chat.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// Convo; if empty will call different widget.
class ChatMessages extends StatelessWidget {
  final List<String> messages;
  final Function(String) onSuggestionSelected;

  const ChatMessages({
    super.key,
    required this.messages,
    required this.onSuggestionSelected,
  });

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Expanded(
      child: messages.isEmpty
          ? NoChat(
              onSuggestionSelected: onSuggestionSelected,
            )
          : ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return Align(
                  alignment: loc.localeName == "ar"
                      ? Alignment.topRight
                      : Alignment.topLeft,
                  child: MessageContainer(
                    messages: messages,
                    index: index,
                  ),
                );
              },
            ),
    );
  }
}
