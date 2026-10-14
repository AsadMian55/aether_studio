import 'package:flutter/material.dart';
import 'aether_colors.dart';

class AetherTheme {
  const AetherTheme._();

  static ThemeData get darkTheme {
    final base = ThemeData.dark(useMaterial3: true);
    return base.copyWith(
      scaffoldBackgroundColor: AetherColors.backgroundPrimary,
      colorScheme: const ColorScheme.dark(
        primary: AetherColors.accentCyan,
        secondary: AetherColors.accentViolet,
        surface: AetherColors.surfaceCard,
        error: AetherColors.accentRose,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AetherColors.backgroundPrimary,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
      ),
      cardTheme: CardThemeData(
        color: AetherColors.surfaceCard,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
          side: const BorderSide(color: AetherColors.borderSubtle),
        ),
      ),
      dividerColor: AetherColors.borderSubtle,
    );
  }
}
