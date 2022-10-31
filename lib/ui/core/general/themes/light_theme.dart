part of 'theme.dart';

ThemeData createLightTheme() {
  const iconTheme = IconThemeData(
    color: TextColors.greyText,
  );
  return ThemeData.light().copyWith(
    textTheme: createTextTheme(),
    useMaterial3: true,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.purple,
      onPrimary: TextColors.whiteText,
      secondary: AppColors.gradientPink,
      onSecondary: TextColors.whiteText,
      error: AppColors.red,
      onError: TextColors.whiteText,
      background: AppColors.whiteBG,
      onBackground: TextColors.darkLabelText,
      surface: AppColors.whiteCard,
      onSurface: TextColors.darkLabelText,
      surfaceTint: AppColors.whiteCard,
    ),
    backgroundColor: AppColors.whiteBG,
    buttonTheme: ButtonThemeData(buttonColor: AppColors.whiteButton),
    cardTheme: CardTheme(surfaceTintColor: null),
    cardColor: Colors.black,
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
