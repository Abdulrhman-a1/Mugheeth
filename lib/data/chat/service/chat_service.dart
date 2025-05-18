import 'dart:convert';
import 'package:graduation/common/theme/constants.dart';
import 'package:http/http.dart' as http;

class ChatService {
  static const String _apiUrl = 'http://localhost:8000';
  List<Map<String, String>> conversationHistory = [];
  final String userId;

  ChatService({String? userId})
      : userId = userId ?? 'guest-${DateTime.now().millisecondsSinceEpoch}';

  int get userMessageCount =>
      conversationHistory.where((msg) => msg['role'] == 'user').length;

  Future<String> trigger({String? text}) async {
    final uri = Uri.parse('$_apiUrl/chat');

    if (text == null || text.isEmpty) {
      throw Exception("Message text cannot be empty!");
    }

    conversationHistory.add({'role': 'user', 'content': text});

    final messagesToSend = conversationHistory
        .map((e) => "${e['role']}: ${e['content']}")
        .toList();

    if (userMessageCount >= 4) {
      messagesToSend.add(
          "system: The user has answered enough. Please stop asking questions and return the final triage assessment in the following format:\n\n"
          "Copy\n"
          "TRIAGE COMPLETE\n"
          "Triage Level: [Level # - Category]\n"
          "Likely Concern: [Brief potential medical concern - not a definitive diagnosis]\n"
          "Recommendation: [Clear next steps for the user]\n"
          "Important guidelines:");
    }

    try {
      final response = await http.post(
        uri,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'user_input': text,
          'chat_history': messagesToSend,
        }),
      );

      if (response.statusCode == 200) {
        final responseBody = utf8.decode(response.bodyBytes);
        final data = jsonDecode(responseBody);
        final aiResponse = data['response'];
        conversationHistory.add({'role': 'assistant', 'content': aiResponse});
        return aiResponse;
      } else {
        throw Exception('Failed to load data with status');
      }
    } catch (e) {
      return "Error: ${AppConstants.err}";
    }
  }

  Future<void> resetConversation() async {
    try {
      final uri = Uri.parse('$_apiUrl/reset');
      await http.post(
        uri,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'user_input': '',
          'chat_history': [],
        }),
      );
      conversationHistory.clear();
    } catch (e) {
      print("Error resetting conversation: ${AppConstants.err}");
    }
  }
}
