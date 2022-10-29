part of 'theme.dart';

ThemeData createLightTheme() {
  const iconTheme = IconThemeData(
    color: AppColors.darkLabelText,
  );
  return ThemeData.light().copyWith(
    useMaterial3: true,
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
      surfaceTint: AppColors.whiteCard,
    ),
    backgroundColor: AppColors.whiteBG,
    buttonTheme: ButtonThemeData(buttonColor: AppColors.whiteButton),
    cardTheme: CardTheme(surfaceTintColor: null),
    cardColor: AppColors.whiteCard,
    iconTheme: iconTheme,
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: AppColors.whiteCard),
      iconTheme: iconTheme,
      actionsIconTheme: iconTheme,
      backgroundColor: AppColors.whiteBG,
      elevation: 1,
      toolbarHeight: 70,
      surfaceTintColor: AppColors.whiteBG,
    ),
  );
}
