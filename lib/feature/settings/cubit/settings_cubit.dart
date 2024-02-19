import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:examplaapplication2024/feature/settings/cubit/change_state.dart';
import 'package:examplaapplication2024/main.dart';
import 'package:examplaapplication2024/feature/helpers.dart/helper.dart';

class ChangeThemeCubit extends Cubit<ChangeThemeState> {
  ChangeThemeCubit()
      : super(
          MyApp.mainSharedPreferences!.getInt('selectedThemeIndex') == 2
              ? ThemeAutoState()
              : MyApp.mainSharedPreferences!.getInt('selectedThemeIndex') == 0
                  ? ThemeLightState()
                  : ThemeDarkState(),
        );

  AppTheme getAppTheme(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    if (MyApp.mainSharedPreferences!.getInt('selectedThemeIndex') == 2) {
      if (brightness == Brightness.light) {
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
        return myThemes[0];
      } else {
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
        return myThemes[1];
      }
    }
    return myThemes[MyApp.mainSharedPreferences!.getInt('selectedThemeIndex')!];
  }

  int getTheme() {
    return MyApp.mainSharedPreferences!.getInt('selectedThemeIndex')!;
  }

  void setThemeMode(int mode) {
    switch (mode) {
      case 0:
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
        emit(ThemeLightState());
        break;
      case 1:
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
        emit(ThemeDarkState());
        break;
      case 2:
        emit(ThemeAutoState());
        break;
    }
    MyApp.mainSharedPreferences!.setInt('selectedThemeIndex', mode);
  }
}
