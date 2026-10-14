import 'package:flutter/material.dart';
import '../../features/agents/data/agent_catalog_data.dart';
import '../../features/agents/domain/agent_persona.dart';
import '../../features/chat/data/chat_seed_data.dart';
import '../../features/chat/domain/chat_message.dart';
import '../../features/image_lab/data/image_generation_seed.dart';
import '../../features/image_lab/domain/generation_job.dart';

class WorkspaceController extends ChangeNotifier {
  int _selectedTabIndex = 0;
  String _selectedModelId = 'aether-omni-4.5';
  bool _extendedThinking = true;
  bool _webSearchEnabled = true;
  final List<ChatMessage> _messages = List.of(ChatSeedData.initialMessages);
  final List<AgentPersona> _agents = List.of(AgentCatalogData.defaultAgents);
  final List<GenerationJob> _generations = List.of(ImageGenerationSeed.jobs);

  int get selectedTabIndex => _selectedTabIndex;
  String get selectedModelId => _selectedModelId;
  bool get extendedThinking => _extendedThinking;
  bool get webSearchEnabled => _webSearchEnabled;
  List<ChatMessage> get messages => List.unmodifiable(_messages);
  List<AgentPersona> get agents => List.unmodifiable(_agents);
  List<GenerationJob> get generations => List.unmodifiable(_generations);

  void setTabIndex(int index) {
    if (_selectedTabIndex == index) return;
    _selectedTabIndex = index;
    notifyListeners();
  }

  void setSelectedModel(String modelId) {
    _selectedModelId = modelId;
    notifyListeners();
  }

  void toggleExtendedThinking() {
    _extendedThinking = !_extendedThinking;
    notifyListeners();
  }

  void toggleWebSearch() {
    _webSearchEnabled = !_webSearchEnabled;
    notifyListeners();
  }

  void sendUserMessage(String content) {
    if (content.trim().isEmpty) return;
    final userMsg = ChatMessage(
      id: 'msg_${DateTime.now().millisecondsSinceEpoch}',
      sender: MessageSender.user,
      content: content.trim(),
      timestamp: 'Just now',
      modelName: _selectedModelId,
      tokensUsed: 42,
      latencyMs: 0,
    );
    final assistantMsg = ChatMessage(
      id: 'msg_${DateTime.now().millisecondsSinceEpoch + 1}',
      sender: MessageSender.assistant,
      content:
          'Synthesized architecture analysis for "${content.trim()}". I have prepared an optimized execution graph with zero-copy tensor streaming and token budget guards.',
      reasoningSummary:
          'Evaluated 4 candidate execution paths, verified context window constraints (128k), and selected low-latency speculative decoding.',
      timestamp: 'Just now',
      modelName: _selectedModelId,
      tokensUsed: 318,
      latencyMs: 420,
      codeSnippet: '''Future<Stream<AgentChunk>> dispatchPipeline(PromptRequest req) async {
  final session = await NeuralRuntime.acquireSession(model: '$_selectedModelId');
  return session.streamCompletion(
    prompt: req.formattedPrompt,
    temperature: 0.2,
    speculativeDecoding: true,
  );
}''',
    );
    _messages.add(userMsg);
    _messages.add(assistantMsg);
    notifyListeners();
  }

  void addGenerationJob(String prompt, String aspectRatio, String stylePreset) {
    if (prompt.trim().isEmpty) return;
    _generations.insert(
      0,
      GenerationJob(
        id: 'gen_${DateTime.now().millisecondsSinceEpoch}',
        prompt: prompt.trim(),
        aspectRatio: aspectRatio,
        stylePreset: stylePreset,
        modelName: 'Aether Flux Pro v2.1',
        steps: 32,
        cfgScale: 6.5,
        seed: 88492014,
        accentHex: 0xFF06B6D4,
        createdAt: 'Just now',
      ),
    );
    notifyListeners();
  }
}

class WorkspaceScope extends InheritedNotifier<WorkspaceController> {
  const WorkspaceScope({
    super.key,
    required WorkspaceController controller,
    required super.child,
  }) : super(notifier: controller);

  static WorkspaceController of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<WorkspaceScope>();
    assert(scope != null, 'No WorkspaceScope found in context');
    return scope!.notifier!;
  }
}
