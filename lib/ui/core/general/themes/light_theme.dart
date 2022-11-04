part of 'theme.dart';

abstract class ThemeConstants {
  static const cardBRadius = BorderRadius.all(Radius.circular(15));
}

ThemeData createLightTheme() {
  const iconTheme = IconThemeData(
    color: LightTextColors.halfInverse,
  );
  final textTheme = createTextTheme();
  return ThemeData.light().copyWith(
    textTheme: textTheme,
    useMaterial3: true,
    highlightColor: AppColors.purpleHighlight,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.purple,
      onPrimary: LightTextColors.inverse,
      secondary: AppColors.gradientPink,
      onSecondary: LightTextColors.inverse,
      error: AppColors.red,
      onError: LightTextColors.inverse,
      background: LightColors.background,
      onBackground: LightTextColors.label,
      surface: LightColors.card,
      onSurface: LightTextColors.label,
      onSecondaryContainer: LightColors.button,
      surfaceTint: LightColors.card,
      secondaryContainer: LightColors.secondaryCard,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: LightTextColors.title,
      ),
    ),
    chipTheme: ChipThemeData(
      labelPadding: EdgeInsets.symmetric(vertical: 6, horizontal: 4),
      selectedColor: Colors.transparent,
      disabledColor: Colors.transparent,
      labelStyle: textTheme.button?.copyWith(color: LightTextColors.halfInverse),
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.resolveWith(
        (states) => states.contains(
          MaterialState.selected,
        )
            ? AppColors.purple
            : LightColors.secondaryCard,
      ),
    ),
    backgroundColor: LightColors.background,
    cardTheme: CardTheme(
      color: LightColors.card,
      shape: RoundedRectangleBorder(borderRadius: ThemeConstants.cardBRadius),
      surfaceTintColor: null,
    ),
    iconTheme: iconTheme,
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: LightColors.card),
      iconTheme: iconTheme,
      actionsIconTheme: iconTheme,
      backgroundColor: LightColors.background,
      elevation: 1,
      toolbarHeight: 75,
      surfaceTintColor: LightColors.background,
    ),
  );
}
