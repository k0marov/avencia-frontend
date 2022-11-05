part of 'theme.dart';

abstract class ThemeConstants {
  static const cardBRadius = BorderRadius.all(Radius.circular(15));
  static const screenPadding = EdgeInsets.symmetric(vertical: 5, horizontal: 12);
  static const sectionSpacing = 15.0;
  static const cardSpacing = 12.0;
  static const buttonSize = 40.0;
  static const textFieldSpacing = 15.0;
}

abstract class ThemeColors {
  Color background();
  Color section();
  Color card();
  Color secondaryCard();
  Color button();
}

abstract class TextColors {
  Color body();
  Color title();
  Color label();
  Color halfInverse();
}

ThemeData createTheme(Brightness brightness) {
  final colors = brightness == Brightness.light ? LightColors() : DarkColors();
  final textColors = brightness == Brightness.light ? LightTextColors() : DarkTextColors();
  final base = brightness == Brightness.light ? ThemeData.light() : ThemeData.dark();
  final iconTheme = IconThemeData(
    color: textColors.halfInverse(),
  );
  final textTheme = createTextTheme(brightness);
  return base.copyWith(
    scaffoldBackgroundColor: colors.background(),
    textTheme: textTheme,
    useMaterial3: true,
    highlightColor: AppColors.purpleHighlight,
    colorScheme: ColorScheme(
      brightness: brightness,
      primary: AppColors.purple,
      onPrimary: AppColors.white,
      secondary: AppColors.gradientPink,
      onSecondary: AppColors.white,
      error: AppColors.red,
      onError: AppColors.white,
      background: colors.background(),
      onBackground: textColors.label(),
      surface: colors.card(),
      onSurface: textColors.label(),
      onSecondaryContainer: colors.button(),
      surfaceTint: colors.card(),
      primaryContainer: colors.section(),
      secondaryContainer: colors.secondaryCard(),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: textColors.body(),
      ),
    ),
    drawerTheme: DrawerThemeData(
      backgroundColor: colors.background(),
    ),
    backgroundColor: colors.background(),
    cardTheme: CardTheme(
      color: colors.card(),
      shape: RoundedRectangleBorder(borderRadius: ThemeConstants.cardBRadius),
      surfaceTintColor: null,
    ),
    iconTheme: iconTheme,
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: colors.card()),
      iconTheme: iconTheme,
      actionsIconTheme: iconTheme,
      backgroundColor: colors.background(),
      foregroundColor: colors.background(),
      elevation: 1,
      toolbarHeight: 75,
      surfaceTintColor: colors.background(),
    ),
  );
}
