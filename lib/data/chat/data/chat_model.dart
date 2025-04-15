class ChatMessage {
  final String role;
  final String content;

  ChatMessage({required this.role, required this.content});

  Map<String, String> toMap() {
    return {
      'role': role,
      'content': content,
    };
  }

  factory ChatMessage.fromMap(Map<String, String> map) {
    return ChatMessage(
      role: map['role'] ?? '',
      content: map['content'] ?? '',
    );
  }
}

class TriageResult {
  final String level;
  final String concern;
  final String recommendation;

  TriageResult({
    required this.level,
    required this.concern,
    required this.recommendation,
  });

  Map<String, String> toMap() {
    return {
      'level': level,
      'concern': concern,
      'recommendation': recommendation,
    };
  }

  factory TriageResult.fromMap(Map<String, String> map) {
    return TriageResult(
      level: map['level'] ?? 'Unknown',
      concern: map['concern'] ?? 'Unknown',
      recommendation: map['recommendation'] ?? '',
    );
  }
}
