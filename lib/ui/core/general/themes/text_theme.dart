part of 'theme.dart';

TextTheme createTextTheme(Brightness brightness) {
  final textColors = brightness == Brightness.light ? LightTextColors() : DarkTextColors();
  final base =
      brightness == Brightness.light ? Typography.blackCupertino : Typography.whiteCupertino;
  final headline4 = GoogleFonts.montserrat(
    fontWeight: FontWeight.w600,
    color: textColors.title(),
    fontSize: 16,
  );
  final button = headline4.copyWith(color: AppColors.white);
  return base.copyWith(
    bodyText1: GoogleFonts.roboto(
      fontWeight: FontWeight.w600,
      color: textColors.body(),
      fontSize: 14,
    ),
    bodyText2: GoogleFonts.roboto(
      fontWeight: FontWeight.w600,
      color: textColors.body(),
      fontSize: 16,
    ),
    headline5: GoogleFonts.montserrat(
      fontWeight: FontWeight.w500,
      color: textColors.label(),
      fontSize: 13,
    ),
    headline4: headline4,
    headline3: GoogleFonts.montserrat(
      color: textColors.title(),
      fontWeight: FontWeight.w600,
      fontSize: 18,
    ),
    headline2: GoogleFonts.roboto(
      color: textColors.body(),
      fontWeight: FontWeight.w700,
      fontSize: 30,
    ),
    headline1: GoogleFonts.poppins(
      color: textColors.body(),
      fontWeight: FontWeight.w600,
      fontSize: 28,
    ),
    button: button,
  );
}
