import 'package:flutter/material.dart';
import '../../../../core/theme/aether_colors.dart';

class MultimodalComposerBar extends StatefulWidget {
  final bool extendedThinking;
  final bool webSearchEnabled;
  final VoidCallback onToggleThinking;
  final VoidCallback onToggleWebSearch;
  final ValueChanged<String> onSubmit;

  const MultimodalComposerBar({
    super.key,
    required this.extendedThinking,
    required this.webSearchEnabled,
    required this.onToggleThinking,
    required this.onToggleWebSearch,
    required this.onSubmit,
  });

  @override
  State<MultimodalComposerBar> createState() => _MultimodalComposerBarState();
}

class _MultimodalComposerBarState extends State<MultimodalComposerBar> {
  final TextEditingController _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _handleSend() {
    final text = _textController.text.trim();
    if (text.isEmpty) return;
    widget.onSubmit(text);
    _textController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 14),
      decoration: const BoxDecoration(
        color: AetherColors.surfaceCard,
        border: Border(top: BorderSide(color: AetherColors.borderSubtle)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              FilterChip(
                selected: widget.extendedThinking,
                onSelected: (_) => widget.onToggleThinking(),
                label: const Text('Deep Reasoning', style: TextStyle(fontSize: 11)),
                selectedColor: AetherColors.accentViolet.withValues(alpha: 0.22),
              ),
              const SizedBox(width: 8),
              FilterChip(
                selected: widget.webSearchEnabled,
                onSelected: (_) => widget.onToggleWebSearch(),
                label: const Text('Live Web Grounding', style: TextStyle(fontSize: 11)),
                selectedColor: AetherColors.accentCyan.withValues(alpha: 0.22),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _textController,
                  onSubmitted: (_) => _handleSend(),
                  style: const TextStyle(fontSize: 14, color: AetherColors.textPrimary),
                  decoration: InputDecoration(
                    hintText: 'Ask Aether Copilot or type / for agent tools...',
                    hintStyle: const TextStyle(color: AetherColors.textMuted, fontSize: 13),
                    filled: true,
                    fillColor: AetherColors.backgroundPrimary,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: const BorderSide(color: AetherColors.borderSubtle),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              IconButton.filled(
                onPressed: _handleSend,
                style: IconButton.styleFrom(
                  backgroundColor: AetherColors.accentCyan,
                  foregroundColor: Colors.black,
                ),
                icon: const Icon(Icons.arrow_upward_rounded),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
