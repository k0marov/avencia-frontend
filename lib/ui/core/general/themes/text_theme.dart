part of 'theme.dart';

TextTheme createTextTheme() {
  final headline4 = GoogleFonts.montserrat(
    fontWeight: FontWeight.w600,
    color: Color(0xFF555267),
    fontSize: 16,
  );
  final button = headline4.copyWith(color: Color(0xFFFFFFFF));
  return Typography.blackCupertino.copyWith(
    bodyText1: GoogleFonts.roboto(
      fontWeight: FontWeight.w600,
      color: LightTextColors.body,
      fontSize: 14,
    ),
    bodyText2: GoogleFonts.roboto(
      fontWeight: FontWeight.w600,
      color: LightTextColors.body,
      fontSize: 16,
    ),
    headline5: GoogleFonts.montserrat(
      fontWeight: FontWeight.w500,
      color: LightTextColors.label,
      fontSize: 13,
    ),
    headline4: headline4,
    headline3: GoogleFonts.montserrat(
      color: Color(0xFF656275),
      fontWeight: FontWeight.w600,
      fontSize: 18,
    ),
    headline2: GoogleFonts.roboto(
      color: LightTextColors.emphasis,
      fontWeight: FontWeight.w700,
      fontSize: 30,
    ),
    headline1: GoogleFonts.poppins(
      color: LightTextColors.emphasis,
      fontWeight: FontWeight.w600,
      fontSize: 28,
    ),
    button: button,
  );
}
