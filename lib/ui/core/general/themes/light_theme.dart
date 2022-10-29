part of 'theme.dart';

ThemeData createLightTheme() => ThemeData(
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: AppColors.purple,
        onPrimary: AppColors.whiteText,
        secondary: AppColors.gradientPink,
        onSecondary: AppColors.whiteText,
        error: AppColors.red,
        onError: AppColors.whiteText,
        background: AppColors.whiteBG,
        onBackground: AppColors.darkText,
        surface: AppColors.whiteCard,
        onSurface: AppColors.darkText,
      ),
    );
