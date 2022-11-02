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
      color: TextColors.bodyText,
      fontSize: 14,
    ),
    bodyText2: GoogleFonts.roboto(
      fontWeight: FontWeight.w600,
      color: TextColors.bodyText,
      fontSize: 18,
    ),
    headline5: GoogleFonts.montserrat(
      fontWeight: FontWeight.w500,
      color: TextColors.darkLabelText,
      fontSize: 13,
    ),
    headline4: headline4,
    headline3: GoogleFonts.montserrat(
      color: Color(0xFF656275),
      fontWeight: FontWeight.w600,
      fontSize: 18,
    ),
    headline2: GoogleFonts.roboto(
      color: TextColors.darkEmphasisText,
      fontWeight: FontWeight.w700,
      fontSize: 30,
    ),
    headline1: GoogleFonts.poppins(
      color: TextColors.darkEmphasisText,
      fontWeight: FontWeight.w600,
      fontSize: 28,
    ),
    button: button,
  );
}
