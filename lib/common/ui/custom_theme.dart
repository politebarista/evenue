import 'package:evenue/common/ui/custom_text_theme.dart';
import 'package:flutter/material.dart';

import 'custom_color_scheme.dart';

class CustomTheme {
  final CustomTextTheme _customTextTheme;

  CustomTheme(this._customTextTheme);

  ThemeData get themeData => ThemeData(
        textTheme: _customTextTheme.getCustomTextTheme(),
        scaffoldBackgroundColor: CustomColorScheme.backgroundColor,
        colorScheme: ColorScheme(
          secondaryVariant: Colors.green,
          primaryVariant: Colors.red,
          onBackground: Colors.red,
          onSurface: Colors.red,
          surface: Colors.red,
          secondary: Colors.red,
          brightness: Brightness.light,
          error: Colors.red,
          background: Colors.red,
          primary: CustomColorScheme.backgroundColor,
          onPrimary: CustomColorScheme.primaryColor,
          onError: Colors.red,
          onSecondary: Colors.green,
        ),
      );
}
