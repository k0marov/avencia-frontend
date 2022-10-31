part of 'theme.dart';

// TODO: implement the text theme

TextTheme createTextTheme() => Typography.blackCupertino.copyWith(
    headline5: GoogleFonts.montserrat(
      fontWeight: FontWeight.w500,
      color: TextColors.darkLabelText,
      fontSize: 13,
    ),
    headline4: GoogleFonts.montserrat(
      fontWeight: FontWeight.w600,
      color: Color(0xFF555267),
      fontSize: 16,
    ),
    headline2: GoogleFonts.roboto(
      color: TextColors.darkEmphasisText,
      fontWeight: FontWeight.w700,
      fontSize: 30,
    ),
    headline3: GoogleFonts.montserrat(
      color: Color(0xFF656275),
      fontWeight: FontWeight.w600,
      fontSize: 18,
    ),
    button: GoogleFonts.montserrat(
      fontWeight: FontWeight.w600,
      color: Color(0xFFFFFFFF),
      fontSize: 16,
    ));
