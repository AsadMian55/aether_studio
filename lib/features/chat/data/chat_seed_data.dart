import '../domain/chat_message.dart';

class ChatSeedData {
  const ChatSeedData._();

  static const List<ChatMessage> initialMessages = [
    ChatMessage(
      id: 'm_1',
      sender: MessageSender.user,
      content:
          'Design a low-latency multi-agent RAG pipeline in Flutter with streaming token decoding and local vector caching.',
      timestamp: '10:42 AM',
      modelName: 'aether-omni-4.5',
      tokensUsed: 34,
      latencyMs: 0,
    ),
    ChatMessage(
      id: 'm_2',
      sender: MessageSender.assistant,
      content:
          'Here is a production-ready reactive streaming architecture. It isolates token decoding on a background isolate and caches HNSW embeddings locally.',
      reasoningSummary:
          'Decomposed pipeline into 3 stages: Query Rewrite -> Hybrid BM25+Cosine Retrieval -> Speculative Token Stream.',
      timestamp: '10:42 AM',
      modelName: 'aether-omni-4.5',
      tokensUsed: 412,
      latencyMs: 340,
      codeSnippet: '''class NeuralPipelineOrchestrator {
  final VectorIndexClient indexClient;
  final InferenceSession session;

  const NeuralPipelineOrchestrator({
    required this.indexClient,
    required this.session,
  });

  Stream<String> executeQuery(String query) async* {
    final chunks = await indexClient.hybridSearch(query, topK: 5);
    yield* session.streamWithContext(query: query, contextChunks: chunks);
  }
}''',
    ),
  ];
}
