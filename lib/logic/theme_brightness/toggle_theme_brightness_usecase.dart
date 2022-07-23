import 'package:avencia/logic/theme_brightness/theme_brightness.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';

typedef ToggleThemeBrightnessUseCase = Future<void> Function();

ToggleThemeBrightnessUseCase newToggleThemeBrightnessUseCase(RxSharedPreferences sp) => () async {
      final currStr = await sp.getString(themeBrightnessSharedPreferencesKey);
      final curr = tbFromValue(currStr);
      final toggled = curr == ThemeBrightness.dark ? ThemeBrightness.light : ThemeBrightness.dark;

      return sp.setString(themeBrightnessSharedPreferencesKey, tbToValue(toggled));
    };
