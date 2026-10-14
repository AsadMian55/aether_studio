import 'package:flutter/material.dart';
import 'aether_colors.dart';

class AetherTypography {
  const AetherTypography._();

  static const TextStyle displaySmall = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.6,
    color: AetherColors.textPrimary,
  );

  static const TextStyle headingMedium = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.3,
    color: AetherColors.textPrimary,
  );

  static const TextStyle titleSmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AetherColors.textPrimary,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14,
    height: 1.5,
    color: AetherColors.textPrimary,
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: 12,
    height: 1.4,
    color: AetherColors.textSecondary,
  );

  static const TextStyle monoCode = TextStyle(
    fontFamily: 'monospace',
    fontSize: 12,
    height: 1.55,
    color: AetherColors.accentCyan,
  );
}
