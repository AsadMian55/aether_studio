import 'package:flutter/material.dart';
import '../core/theme/aether_theme.dart';
import 'navigation/workspace_shell.dart';
import 'state/workspace_controller.dart';

class AetherApp extends StatefulWidget {
  const AetherApp({super.key});

  @override
  State<AetherApp> createState() => _AetherAppState();
}

class _AetherAppState extends State<AetherApp> {
  late final WorkspaceController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WorkspaceController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return MaterialApp(
          title: 'Aether Studio',
          debugShowCheckedModeBanner: false,
          theme: AetherTheme.darkTheme,
          home: WorkspaceScope(
            controller: _controller,
            child: const WorkspaceShell(),
          ),
        );
      },
    );
  }
}
