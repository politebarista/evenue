import 'package:evenue/common/definition/app_definition.dart';
import 'package:evenue/common/definition/debug_app_definition.dart';
import 'package:evenue/common/flavor.dart';
import 'package:evenue/common/ui/custom_color_scheme.dart';
import 'package:flutter/material.dart';

class Config {
  static late final Flavor flavor;

  static AppDefinition? _currentAppDef;

  static AppDefinition get appDef {
    late final currentAppDef;

    if (_currentAppDef == null) {
      switch (flavor) {
        case Flavor.debug:
          currentAppDef = DebugAppDefinition();
          break;
        case Flavor.production:
          currentAppDef = DebugAppDefinition(); // TODO CHANGE THIS TO PROD
          break;
      }
      _currentAppDef = currentAppDef;
    } else {
      currentAppDef = _currentAppDef;
    }

    return currentAppDef;
  }

  static ThemeData get themeData => ThemeData(
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
          primary: CustomColorScheme.primaryColor,
          onPrimary: CustomColorScheme.backgroundColor,
          onError: Colors.red,
          onSecondary: Colors.green,
        ),
      );
}
