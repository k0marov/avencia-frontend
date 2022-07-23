import 'package:avencia/logic/theme_brightness/theme_brightness.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';

typedef GetThemeBrightnessStreamUseCase = Stream<ThemeBrightness> Function();

GetThemeBrightnessStreamUseCase newGetThemeBrightnessUseCase(RxSharedPreferences sp) => () {
      return sp.getStringStream(themeBrightnessSharedPreferencesKey).map(
            (val) => val == null ? ThemeBrightness.unset : tbFromValue(val),
          );
    };
