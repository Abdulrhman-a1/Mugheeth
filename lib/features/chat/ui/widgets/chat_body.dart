import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:graduation/data/auth/service/auth_service.dart';
import 'package:graduation/features/chat/logic/chat_service.dart';
import 'package:graduation/features/chat/ui/widgets/chat_bar.dart';
import 'package:graduation/features/chat/ui/widgets/input_field.dart';
import 'package:graduation/features/chat/ui/widgets/messages.dart';

class ChatBody extends StatelessWidget {
  const ChatBody({
    super.key,
    required this.chatService,
    required this.authService,
    required this.scrollController,
    required this.isLoading,
    required this.hasGuestCompletedTriage,
    required this.onSend,
  });

  final Chatmessages chatService;
  final AuthService authService;
  final ScrollController scrollController;
  final bool isLoading;
  final bool hasGuestCompletedTriage;
  final void Function(String) onSend;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final isLoggedIn = authService.userNameNotifier.value != null &&
        authService.userNameNotifier.value!.isNotEmpty;

    final isInputEnabled = isLoggedIn
        ? !chatService.isTriageComplete
        : !hasGuestCompletedTriage && !chatService.isTriageComplete;

    return Column(
      children: [
        ChatBar(onClearMessages: chatService.clearMessages),
        Expanded(
          child: ChatMessages(
            messages: chatService.messages,
            isLoading: isLoading,
            onSuggestionSelected: onSend,
            scrollController: scrollController,
          ),
        ),
        ChatInputField(
          onSend: onSend,
          enabled: isInputEnabled,
          hintText: !isLoggedIn && hasGuestCompletedTriage
              ? loc.signIntohaveAchat
              : (chatService.isTriageComplete
                  ? loc.loginUserCanHaveMore
                  : null),
        ),
      ],
    );
  }
}
