enum MessageSender { user, assistant, system }

class ChatMessage {
  final String id;
  final MessageSender sender;
  final String content;
  final String timestamp;
  final String modelName;
  final int tokensUsed;
  final int latencyMs;
  final String? reasoningSummary;
  final String? codeSnippet;

  const ChatMessage({
    required this.id,
    required this.sender,
    required this.content,
    required this.timestamp,
    required this.modelName,
    required this.tokensUsed,
    required this.latencyMs,
    this.reasoningSummary,
    this.codeSnippet,
  });
}
