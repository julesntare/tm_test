import 'package:flutter/material.dart';
import 'colors.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: WalletColors.primary),
    primaryColor: WalletColors.primary,
    primarySwatch: Colors.green,
    scaffoldBackgroundColor: WalletColors.background,
    cardColor: WalletColors.cardBackground,
    appBarTheme: const AppBarTheme(
      foregroundColor: WalletColors.textPrimary,
      backgroundColor: WalletColors.cardBackground,
    ),
    textTheme: TextTheme(
      headlineSmall: TextStyle(color: WalletColors.textPrimary),
      titleMedium: TextStyle(color: WalletColors.textPrimary),
      bodyMedium: TextStyle(color: WalletColors.textSecondary),
    ),
    iconTheme: const IconThemeData(
      color: WalletColors.textPrimary,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: DarkWalletColors.primary,
      brightness: Brightness.dark,
    ),
    primaryColor: DarkWalletColors.primary,
    scaffoldBackgroundColor: DarkWalletColors.background,
    cardColor: DarkWalletColors.cardBackground,
    appBarTheme: const AppBarTheme(
      foregroundColor: DarkWalletColors.textPrimary,
      backgroundColor: DarkWalletColors.cardBackground,
    ),
    textTheme: TextTheme(
      headlineSmall: TextStyle(color: DarkWalletColors.textPrimary),
      titleMedium: TextStyle(color: DarkWalletColors.textPrimary),
      bodyMedium: TextStyle(color: DarkWalletColors.textSecondary),
    ),
    iconTheme: const IconThemeData(
      color: DarkWalletColors.textPrimary,
    ),
  );
}