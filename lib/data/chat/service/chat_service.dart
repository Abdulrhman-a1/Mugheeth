import 'dart:convert';
import 'package:graduation/common/theme/constants.dart';
import 'package:http/http.dart' as http;

class ChatService {
  final String _apiUrl = AppConstants.apiUrl;
  List<Map<String, String>> conversationHistory = [];
  final String _userId;

  ChatService({String? userId})
      : _userId = userId ?? 'guest-${DateTime.now().millisecondsSinceEpoch}';

  Future<String> trigger({String? text}) async {
    final uri = Uri.parse('$_apiUrl/chat');

    if (text == null || text.isEmpty) {
      throw Exception("Message text cannot be empty!");
    }

    conversationHistory.add({'role': 'user', 'content': text});

    try {
      final response = await http.post(
        uri,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'user_id': _userId,
          'message': text,
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
          'user_id': _userId,
          'message': '',
        }),
      );
      conversationHistory.clear();
    } catch (e) {
      print("Error resetting conversation: ${AppConstants.err}");
    }
  }
}
