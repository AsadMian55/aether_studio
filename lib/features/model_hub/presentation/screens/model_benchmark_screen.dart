import 'package:flutter/material.dart';
import '../../../../core/theme/aether_colors.dart';
import '../../../../core/theme/aether_typography.dart';

class ModelBenchmarkScreen extends StatefulWidget {
  const ModelBenchmarkScreen({super.key});

  @override
  State<ModelBenchmarkScreen> createState() => _ModelBenchmarkScreenState();
}

class _ModelBenchmarkScreenState extends State<ModelBenchmarkScreen> {
  int _selectedFilterIndex = 0;
  bool _realtimeSync = true;

  static const List<String> _filters = ['All Modules', 'Active Runtime', 'Low Latency', 'Verified'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 16,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Side-by-Side Arena Evaluation', style: AetherTypography.headingMedium),
            Text('Compare output quality, TTFT, and token cost across two models', style: AetherTypography.bodySmall),
          ],
        ),
        actions: [
          Switch(
            value: _realtimeSync,
            activeColor: AetherColors.accentCyan,
            onChanged: (val) => setState(() => _realtimeSync = val),
          ),
          const SizedBox(width: 12),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AetherColors.accentCyan.withValues(alpha: 0.16),
                  AetherColors.accentViolet.withValues(alpha: 0.12),
                ],
              ),
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: AetherColors.borderHighlight),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Arena Elo', style: AetherTypography.bodySmall),
                    SizedBox(height: 4),
                    Text('1384 Rating', style: AetherTypography.displaySmall),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: AetherColors.accentEmerald.withValues(alpha: 0.16),
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Text(
                    _realtimeSync ? 'LIVE STREAM' : 'PAUSED',
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: AetherColors.accentEmerald,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 38,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: _filters.length,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (context, index) {
                final selected = index == _selectedFilterIndex;
                return ChoiceChip(
                  label: Text(_filters[index]),
                  selected: selected,
                  onSelected: (_) => setState(() => _selectedFilterIndex = index),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          ...List.generate(4, (index) {
            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AetherColors.surfaceCard,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AetherColors.borderSubtle),
              ),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AetherColors.surfaceElevated,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(Icons.auto_awesome, color: AetherColors.accentCyan, size: 18),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Side-by-Side Arena Evaluation Node #${index + 1}',
                          style: AetherTypography.titleSmall,
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'Zero-copy tensor dispatch • Verified runtime state',
                          style: AetherTypography.bodySmall,
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.chevron_right, color: AetherColors.textMuted),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
