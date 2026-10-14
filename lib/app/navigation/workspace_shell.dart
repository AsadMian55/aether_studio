import 'package:flutter/material.dart';
import '../../core/theme/aether_colors.dart';
import '../../features/agents/presentation/screens/agent_marketplace_screen.dart';
import '../../features/chat/presentation/screens/chat_workspace_screen.dart';
import '../../features/image_lab/presentation/screens/image_studio_screen.dart';
import '../../features/usage_analytics/presentation/screens/usage_analytics_screen.dart';
import '../../features/workflows/presentation/screens/workflow_builder_screen.dart';
import '../state/workspace_controller.dart';

class WorkspaceShell extends StatelessWidget {
  const WorkspaceShell({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = WorkspaceScope.of(context);
    final screens = const [
      ChatWorkspaceScreen(),
      AgentMarketplaceScreen(),
      ImageStudioScreen(),
      WorkflowBuilderScreen(),
      UsageAnalyticsScreen(),
    ];

    return Scaffold(
      body: IndexedStack(
        index: controller.selectedTabIndex,
        children: screens,
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: AetherColors.surfaceElevated,
          border: Border(
            top: BorderSide(color: AetherColors.borderSubtle, width: 1),
          ),
        ),
        child: NavigationBar(
          selectedIndex: controller.selectedTabIndex,
          onDestinationSelected: controller.setTabIndex,
          backgroundColor: Colors.transparent,
          indicatorColor: AetherColors.accentCyan.withValues(alpha: 0.16),
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          height: 68,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.auto_awesome_outlined),
              selectedIcon: Icon(Icons.auto_awesome, color: AetherColors.accentCyan),
              label: 'Copilot',
            ),
            NavigationDestination(
              icon: Icon(Icons.hub_outlined),
              selectedIcon: Icon(Icons.hub, color: AetherColors.accentCyan),
              label: 'Agents',
            ),
            NavigationDestination(
              icon: Icon(Icons.blur_on_outlined),
              selectedIcon: Icon(Icons.blur_on, color: AetherColors.accentCyan),
              label: 'Imagine',
            ),
            NavigationDestination(
              icon: Icon(Icons.account_tree_outlined),
              selectedIcon: Icon(Icons.account_tree, color: AetherColors.accentCyan),
              label: 'Flows',
            ),
            NavigationDestination(
              icon: Icon(Icons.QueryStats_outlined),
              selectedIcon: Icon(Icons.query_stats, color: AetherColors.accentCyan),
              label: 'Telemetry',
            ),
          ],
        ),
      ),
    );
  }
}
