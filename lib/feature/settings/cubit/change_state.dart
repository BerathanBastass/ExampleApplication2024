import 'package:flutter/foundation.dart';

@immutable
abstract class ChangeThemeState {}

class ThemeLightState extends ChangeThemeState {}

class ThemeDarkState extends ChangeThemeState {}

class ThemeAutoState extends ChangeThemeState {}
