import 'package:flutter/material.dart';
import '../../../../app/state/workspace_controller.dart';
import '../../../../core/theme/aether_colors.dart';
import '../../../../core/theme/aether_typography.dart';
import '../../../knowledge_base/presentation/screens/knowledge_base_screen.dart';
import '../../../model_hub/presentation/screens/model_hub_screen.dart';
import '../../../prompt_vault/presentation/screens/prompt_vault_screen.dart';
import '../../../settings/presentation/screens/settings_screen.dart';
import '../../../voice_live/presentation/screens/voice_session_screen.dart';
import '../widgets/message_bubble_card.dart';
import '../widgets/multimodal_composer_bar.dart';

class ChatWorkspaceScreen extends StatelessWidget {
  const ChatWorkspaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = WorkspaceScope.of(context);

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 16,
        title: Row(
          children: [
            Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [AetherColors.accentCyan, AetherColors.accentViolet],
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.bolt, color: Colors.white, size: 20),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Aether Copilot', style: AetherTypography.titleSmall),
                  Text(
                    controller.selectedModelId,
                    style: const TextStyle(fontSize: 11, color: AetherColors.accentCyan),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            tooltip: 'Voice Session',
            icon: const Icon(Icons.graphic_eq, color: AetherColors.accentCyan),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const VoiceSessionScreen()),
              );
            },
          ),
          IconButton(
            tooltip: 'Prompt Vault',
            icon: const Icon(Icons.auto_stories_outlined),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const PromptVaultScreen()),
              );
            },
          ),
          IconButton(
            tooltip: 'RAG Knowledge Base',
            icon: const Icon(Icons.storage_outlined),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const KnowledgeBaseScreen()),
              );
            },
          ),
          IconButton(
            tooltip: 'Model Hub',
            icon: const Icon(Icons.memory_outlined),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const ModelHubScreen()),
              );
            },
          ),
          IconButton(
            tooltip: 'Settings',
            icon: const Icon(Icons.tune_outlined),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const SettingsScreen()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 20),
              itemCount: controller.messages.length,
              separatorBuilder: (_, __) => const SizedBox(height: 14),
              itemBuilder: (context, index) {
                return MessageBubbleCard(message: controller.messages[index]);
              },
            ),
          ),
          MultimodalComposerBar(
            extendedThinking: controller.extendedThinking,
            webSearchEnabled: controller.webSearchEnabled,
            onToggleThinking: controller.toggleExtendedThinking,
            onToggleWebSearch: controller.toggleWebSearch,
            onSubmit: controller.sendUserMessage,
          ),
        ],
      ),
    );
  }
}
