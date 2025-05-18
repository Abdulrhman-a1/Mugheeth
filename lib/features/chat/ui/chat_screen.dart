import 'package:flutter/material.dart';
import 'package:graduation/common/theme/colors.dart';
import 'package:graduation/common/widget/layout/screen.dart';
import 'package:graduation/common/widget/pop_up/triage_result.dart';
import 'package:graduation/features/chat/ui/widgets/chat_body.dart';
import 'package:graduation/data/auth/service/auth_service.dart';
import 'package:graduation/features/chat/logic/chat_service.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  final Chatmessages chatService = Chatmessages();
  final AuthService authService = AuthService();
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;
  bool hasGuestCompletedTriage = false;

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void sendMessage(String message) async {
    if (message.isEmpty || chatService.isTriageComplete) return;

    final isLoggedIn = authService.userNameNotifier.value != null &&
        authService.userNameNotifier.value!.isNotEmpty;

    if (!isLoggedIn && hasGuestCompletedTriage) return;

    final isFirstMessage = chatService.messages.isEmpty;

    setState(() {
      chatService.addUserMessage(message);
      isLoading = true;
    });

    if (isFirstMessage) {}

    scrollToBottom();

    try {
      final response = await chatService.sendMessage(message);
      if (response.isTriageComplete) {
        if (!isLoggedIn) {
          hasGuestCompletedTriage = true;
        }
        showTriageResult();
      }
    } catch (e) {
      showErrorMessage(e.toString());
    } finally {
      setState(() {
        isLoading = false;
      });
      scrollToBottom();
    }
  }

  void showErrorMessage(String error) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error: $error')),
    );
  }

  void showTriageResult() {
    showModalBottomSheet(
      context: context,
      isDismissible: false,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) => TriageResultModal(
        triageResult: chatService.triageResult!,
        onDismiss: () => Navigator.pop(context),
        onNewSession: () {
          chatService.clearMessages();
          setState(() {
            chatService.resetTriage();
            hasGuestCompletedTriage = false;
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Screen(
      backgroundColor: AppColors.chatScreenGrey,
      onClearMessages: () {
        chatService.clearMessages();
        setState(() {});
      },
      child: ChatBody(
        chatService: chatService,
        authService: authService,
        scrollController: scrollController,
        isLoading: isLoading,
        hasGuestCompletedTriage: hasGuestCompletedTriage,
        onSend: sendMessage,
      ),
    );
  }
}
