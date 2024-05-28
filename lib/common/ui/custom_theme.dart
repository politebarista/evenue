import 'package:evenue/common/ui/custom_text_theme.dart';
import 'package:flutter/material.dart';

import 'custom_color_scheme.dart';

class CustomTheme {
  final CustomTextTheme _customTextTheme;

  ThemeData get themeData => ThemeData(
    textTheme: _customTextTheme.getCustomTextTheme(),
    scaffoldBackgroundColor: CustomColorScheme.backgroundColor,
    colorScheme: ColorScheme(
      onSurface: CustomColorScheme.primaryColor,
      surface: CustomColorScheme.surfaceColor,
      secondary: CustomColorScheme.secondaryColor,
      onSecondary: CustomColorScheme.backgroundColor,
      brightness: Brightness.light,
      error: Colors.orange,
      // ignore: no-equal-arguments
      primary: CustomColorScheme.primaryColor,
      // ignore: no-equal-arguments
      onPrimary: CustomColorScheme.backgroundColor,
      onError: Colors.red,
    ),
  );

  CustomTheme(this._customTextTheme);
}
