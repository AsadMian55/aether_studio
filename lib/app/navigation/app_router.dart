import 'package:flutter/material.dart';
import '../../features/agents/presentation/screens/agent_marketplace_screen.dart';
import '../../features/chat/presentation/screens/chat_workspace_screen.dart';
import '../../features/image_lab/presentation/screens/image_studio_screen.dart';
import '../../features/knowledge_base/presentation/screens/knowledge_base_screen.dart';
import '../../features/model_hub/presentation/screens/model_hub_screen.dart';
import '../../features/prompt_vault/presentation/screens/prompt_vault_screen.dart';
import '../../features/settings/presentation/screens/settings_screen.dart';
import '../../features/usage_analytics/presentation/screens/usage_analytics_screen.dart';
import '../../features/voice_live/presentation/screens/voice_session_screen.dart';
import '../../features/workflows/presentation/screens/workflow_builder_screen.dart';
import 'app_routes.dart';
import 'workspace_shell.dart';

class AppRouter {
  const AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.chat:
        return _fadeRoute(const ChatWorkspaceScreen(), settings);
      case AppRoutes.agents:
        return _fadeRoute(const AgentMarketplaceScreen(), settings);
      case AppRoutes.imageLab:
        return _fadeRoute(const ImageStudioScreen(), settings);
      case AppRoutes.voiceLive:
        return _fadeRoute(const VoiceSessionScreen(), settings);
      case AppRoutes.workflows:
        return _fadeRoute(const WorkflowBuilderScreen(), settings);
      case AppRoutes.promptVault:
        return _fadeRoute(const PromptVaultScreen(), settings);
      case AppRoutes.knowledgeBase:
        return _fadeRoute(const KnowledgeBaseScreen(), settings);
      case AppRoutes.modelHub:
        return _fadeRoute(const ModelHubScreen(), settings);
      case AppRoutes.analytics:
        return _fadeRoute(const UsageAnalyticsScreen(), settings);
      case AppRoutes.settings:
        return _fadeRoute(const SettingsScreen(), settings);
      case AppRoutes.workspace:
      default:
        return _fadeRoute(const WorkspaceShell(), settings);
    }
  }

  static PageRouteBuilder<T> _fadeRoute<T>(Widget page, RouteSettings settings) {
    return PageRouteBuilder<T>(
      settings: settings,
      pageBuilder: (_, __, ___) => page,
      transitionsBuilder: (_, animation, __, child) {
        return FadeTransition(opacity: animation, child: child);
      },
    );
  }
}
