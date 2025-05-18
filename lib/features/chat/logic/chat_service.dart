import 'dart:convert';
import 'dart:async';
import 'package:graduation/common/theme/triage_regex.dart';
import 'package:graduation/data/chat/service/chat_service.dart';

class Chatmessages {
  final List<Map<String, String>> _messages = [];
  bool _isTriageComplete = false;
  Map<String, String>? _triageResult;
  bool isLastUserMessageArabic = false;
  final ChatService _connect = ChatService();

  List<Map<String, String>> get messages => [..._messages];
  bool get isTriageComplete => _isTriageComplete;
  Map<String, String>? get triageResult => _triageResult;

  void addUserMessage(String message) {
    _messages.add({'role': 'user', 'content': message});
    isLastUserMessageArabic = detectArabic(message);
  }

  void resetTriage() {
    _isTriageComplete = false;
    _triageResult = null;
  }

  void clearMessages() {
    _messages.clear();
    _isTriageComplete = false;
    _triageResult = null;
    isLastUserMessageArabic = false;
    _connect.resetConversation();
  }

  void clearAllMessages() {
    messages.clear();
    _connect.resetConversation();
  }

  Future<MessageResponse> sendMessage(String message) async {
    final response = await _connect.trigger(text: message);

    if (_isJson(response)) {
      return _handleJsonResponse(response);
    } else {
      return _handleTextResponse(response);
    }
  }

  MessageResponse _handleJsonResponse(String response) {
    final data = jsonDecode(response);
    _messages.add({'role': 'assistant', 'content': data.toString()});

    if (data['triage_complete'] == true) {
      _triageResult = {
        'level': data['triage_level'] ?? '',
        'concern': data['diagnosis'] ?? '',
        'recommendation': data['recommendation'] ?? '',
      };
      _isTriageComplete = true;
      return MessageResponse(isTriageComplete: true);
    }

    return MessageResponse(isTriageComplete: false);
  }

  MessageResponse _handleTextResponse(String response) {
    _messages.add({'role': 'assistant', 'content': response});

    final isComplete = _checkTriageComplete(response);
    if (isComplete) {
      _isTriageComplete = true;
      _triageResult = parseTriageResult(response);
      return MessageResponse(isTriageComplete: true);
    }

    return MessageResponse(isTriageComplete: false);
  }

  bool _checkTriageComplete(String message) {
    return message.toUpperCase().contains("TRIAGE COMPLETE") ||
        message.contains("اكتمل الفرز") ||
        message.contains("تم الفرز") ||
        message.contains("تم اكتمال الفرز الطبي");
  }

  bool _isJson(String message) {
    try {
      jsonDecode(message);
      return true;
    } catch (_) {
      return false;
    }
  }
}

class MessageResponse {
  final bool isTriageComplete;

  MessageResponse({required this.isTriageComplete});
}
