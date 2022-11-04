part of 'theme.dart';

// TODO: split this into AppColors, DarkColors, LightColors

abstract class AppColors {
  static const white = Color(0xFFFFFFFF);
  static const green = Color(0xFF51E289);
  static const red = Color(0xFFF65973);
  static const purple = Color(0xFF9C42F5);
  static const purpleHighlight = Color(0x329C42F5);
  static const gradientPink = Color(0xFFE720C1);
  static const gradientPurple = Color(0xFF7035E7);
}

class LightColors implements ThemeColors {
  @override
  Color background() => AppColors.white;
  @override
  Color section() => const Color(0xFFFEFEFE);
  @override
  Color card() => const Color(0xFFF6F6F6);
  @override
  Color secondaryCard() => const Color(0xFFE9E7EE);
  @override
  Color button() => const Color(0xFFEFEFF1);
}

class DarkColors implements ThemeColors {
  @override
  Color background() => const Color(0xFF282A2E);
  @override
  Color section() => const Color(0xFF3C3E41);
  @override
  Color card() => const Color(0xFF43464B);
  @override
  Color secondaryCard() => const Color(0xFF4C4E55);
  @override
  Color button() => const Color(0xFF4B4D54);
}

class LightTextColors implements TextColors {
  @override
  Color body() => const Color(0xFF4F4E63);
  @override
  Color title() => const Color(0xFF555267);
  @override
  Color label() => const Color(0xFF515151);
  @override
  Color halfInverse() => const Color(0xFFAAAAB2);
}

class DarkTextColors implements TextColors {
  @override
  Color body() => const Color(0xFFFFFFFF);
  @override
  Color title() => const Color(0xFFFFFFFF);
  @override
  Color label() => const Color(0xFFE0E0FF);
  @override
  Color halfInverse() => const Color(0xFFE0E0FF);
}
