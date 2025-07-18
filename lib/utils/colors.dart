import 'package:flutter/material.dart';

class AppColors extends ThemeExtension<AppColors> {
  const AppColors._({
    required this.primary,
    required this.unselectedButtonNavBar,
    required this.secondary,
    required this.text,
    required this.chevronRight,
    required this.divider,
    required this.deleteButton,
    required this.background,
    required this.surfaceContainer,
  });

  final Color primary;
  final Color unselectedButtonNavBar;
  final Color secondary;
  final Color text;
  final Color chevronRight;
  final Color divider;
  final Color deleteButton;
  final Color background;
  final Color surfaceContainer;

  factory AppColors.light() {
    return const AppColors._(
      primary: Color(0xFF2AE881),
      secondary: Color(0xFFD4FAE6),
      chevronRight: Color(0xFF3C434D),
      unselectedButtonNavBar: Color(0xFF49454F),
      text: Color(0xFF1D1B20),
      divider: Color(0xFFCAC4D0),
      deleteButton: Color(0xFFE46962),
      background: Color(0xFFFFFFFF),
      surfaceContainer: Color(0xFFF3EDF7),
    );
  }

  factory AppColors.dark() {
    return const AppColors._(
      primary: Color(0xFF2AE881),
      secondary: Color(0xFF234636),
      chevronRight: Color(0xFF3C434D),
      unselectedButtonNavBar: Color(0xFF1F1C22),
      text: Color(0xFFFFFFFF),
      divider: Color(0xFFCAC4D0),
      deleteButton: Color(0xFFEF7C76),
      background: Color(0xFF121212),
      surfaceContainer: Color(0xFF1E1E1E),
    );
  }

  factory AppColors.lightWithCustomPrimary(Color primaryColor) {
    return AppColors._(
      primary: primaryColor,
      secondary: Color.lerp(primaryColor, Colors.white, 0.9)!,
      chevronRight: const Color(0xFF3C434D),
      unselectedButtonNavBar: const Color(0xFF49454F),
      text: const Color(0xFF1D1B20),
      divider: const Color(0xFFCAC4D0),
      deleteButton: const Color(0xFFE46962),
      background: const Color(0xFFFFFFFF),
      surfaceContainer: const Color(0xFFF3EDF7),
    );
  }

  factory AppColors.darkWithCustomPrimary(Color primaryColor) {
    return AppColors._(
      primary: primaryColor,
      secondary: Color.lerp(primaryColor, Colors.black, 0.8)!,
      chevronRight: const Color(0xFF3C434D),
      unselectedButtonNavBar: const Color(0xFF1F1C22),
      text: const Color(0xFFFFFFFF),
      divider: const Color(0xFFCAC4D0),
      deleteButton: const Color(0xFFEF7C76),
      background: const Color(0xFF121212),
      surfaceContainer: const Color(0xFF1E1E1E),
    );
  }

  @override
  AppColors copyWith({
    Color? primary,
    Color? secondary,
    Color? text,
    Color? deleteButton,
    Color? divider,
    Color? background,
    Color? surfaceContainer,
    Color? chevronRight,
    Color? unselectedButtonNavBar,
  }) {
    return AppColors._(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      background: background ?? this.background,
      text: text ?? this.text,
      chevronRight: chevronRight ?? this.chevronRight,
      divider: divider ?? this.divider,
      unselectedButtonNavBar:
          unselectedButtonNavBar ?? this.unselectedButtonNavBar,
      deleteButton: deleteButton ?? this.deleteButton,
      surfaceContainer: surfaceContainer ?? this.surfaceContainer,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;
    return AppColors._(
      divider: Color.lerp(divider, other.divider, t)!,
      chevronRight: Color.lerp(chevronRight, other.chevronRight, t)!,
      primary: Color.lerp(primary, other.primary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      text: Color.lerp(text, other.text, t)!,
      unselectedButtonNavBar:
          Color.lerp(unselectedButtonNavBar, other.unselectedButtonNavBar, t)!,
      deleteButton: Color.lerp(deleteButton, other.deleteButton, t)!,
      background: Color.lerp(background, other.background, t)!,
      surfaceContainer:
          Color.lerp(surfaceContainer, other.surfaceContainer, t)!,
    );
  }
}
