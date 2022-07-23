enum ThemeBrightness { dark, light }

ThemeBrightness tbFromValue(String? value) => value == null
    ? ThemeBrightness.light
    : value == lightThemeValue
        ? ThemeBrightness.light
        : ThemeBrightness.dark;
String tbToValue(ThemeBrightness tb) => tb == ThemeBrightness.light ? lightThemeValue : darkThemeValue;

const themeBrightnessSharedPreferencesKey = "THEME_BRIGHTNESS";
const lightThemeValue = "light";
const darkThemeValue = "dark";
