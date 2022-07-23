import 'package:avencia/logic/theme_brightness/theme_brightness.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';

typedef UpdateThemeBrightnessUseCase = Future<void> Function(ThemeBrightness);

UpdateThemeBrightnessUseCase newUpdateThemeBrightnessUseCase(RxSharedPreferences sp) => (tb) {
      return sp.setString(themeBrightnessSharedPreferencesKey, tbToValue(tb));
    };
