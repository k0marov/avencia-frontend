part of 'theme.dart';

ThemeData createLightTheme() {
  const iconTheme = IconThemeData(
    color: TextColors.greyText,
  );
  final textTheme = createTextTheme();
  return ThemeData.light().copyWith(
    textTheme: textTheme,
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
      onSecondaryContainer: AppColors.whiteButton,
      surfaceTint: AppColors.whiteCard,
      secondaryContainer: AppColors.greyCard,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: TextColors.darkTitleText,
      ),
    ),
    chipTheme: ChipThemeData(
      labelPadding: EdgeInsets.symmetric(vertical: 6, horizontal: 4),
      selectedColor: AppColors.whiteCard,
      disabledColor: AppColors.whiteCard,
      labelStyle: textTheme.button?.copyWith(color: TextColors.greyText),
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.resolveWith(
        (states) => states.contains(
          MaterialState.selected,
        )
            ? AppColors.purple
            : AppColors.greyCard,
      ),
    ),
    backgroundColor: AppColors.whiteBG,
    cardTheme: CardTheme(
      color: AppColors.whiteCard,
      surfaceTintColor: null,
    ),
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
