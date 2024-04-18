import 'package:evenue/common/ui/custom_color_scheme.dart';
import 'package:flutter/material.dart';

class CustomTextTheme {
  final BuildContext context;

  final TextTheme _defaultTextTheme;
  
  CustomTextTheme(this.context)
      : _defaultTextTheme = Theme.of(context).textTheme;

  TextTheme getCustomTextTheme() {
    return TextTheme(
      displayLarge: _defaultTextTheme.displayLarge!.copyWith(
        color: CustomColorScheme.textColor,
      ),
      displayMedium: _defaultTextTheme.displayMedium!.copyWith(
        color: CustomColorScheme.textColor,
      ),
      displaySmall: _defaultTextTheme.displaySmall!.copyWith(
        color: CustomColorScheme.textColor,
      ),
      headlineMedium: _defaultTextTheme.headlineMedium!.copyWith(
        color: CustomColorScheme.textColor,
      ),
      headlineSmall: _defaultTextTheme.headlineSmall!.copyWith(
        color: CustomColorScheme.textColor,
      ),
      titleLarge: _defaultTextTheme.titleLarge!.copyWith(
        color: CustomColorScheme.textColor,
      ),
      titleMedium: _defaultTextTheme.titleMedium!.copyWith(
        color: CustomColorScheme.textColor,
      ),
      titleSmall: _defaultTextTheme.titleSmall!.copyWith(
        color: CustomColorScheme.textColor,
      ),
      bodyLarge: _defaultTextTheme.bodyLarge!,
      bodyMedium: _defaultTextTheme.bodyMedium!,
      bodySmall: _defaultTextTheme.bodySmall!.copyWith(
        color: CustomColorScheme.textColor,
      ),
      labelLarge: _defaultTextTheme.labelLarge!.copyWith(
        color: CustomColorScheme.textColor,
      ),
      labelSmall: _defaultTextTheme.labelSmall!.copyWith(
        color: CustomColorScheme.textColor,
      ),
    );
  }
}
