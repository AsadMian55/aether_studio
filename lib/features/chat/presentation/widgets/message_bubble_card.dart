import 'package:flutter/material.dart';
import '../../../../core/theme/aether_colors.dart';
import '../../../../core/theme/aether_typography.dart';
import '../../domain/chat_message.dart';

class MessageBubbleCard extends StatelessWidget {
  final ChatMessage message;

  const MessageBubbleCard({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final isUser = message.sender == MessageSender.user;

    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 640),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isUser ? AetherColors.surfaceElevated : AetherColors.surfaceCard,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: isUser
                ? AetherColors.accentCyan.withValues(alpha: 0.35)
                : AetherColors.borderSubtle,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  isUser ? 'You' : message.modelName,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: isUser ? AetherColors.accentCyan : AetherColors.accentViolet,
                  ),
                ),
                Text(message.timestamp, style: AetherTypography.bodySmall),
              ],
            ),
            if (message.reasoningSummary != null) ...[
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AetherColors.backgroundPrimary,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AetherColors.borderSubtle),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.psychology_outlined, size: 16, color: AetherColors.accentAmber),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        message.reasoningSummary!,
                        style: const TextStyle(fontSize: 12, color: AetherColors.textSecondary),
                      ),
                    ),
                  ],
                ),
              ),
            ],
            const SizedBox(height: 10),
            Text(message.content, style: AetherTypography.bodyMedium),
            if (message.codeSnippet != null) ...[
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFF05070B),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AetherColors.borderSubtle),
                ),
                child: Text(message.codeSnippet!, style: AetherTypography.monoCode),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
