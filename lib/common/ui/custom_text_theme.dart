import 'package:evenue/common/ui/custom_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextTheme {
  final BuildContext context;

  final TextTheme _defaultTextTheme;
  
  CustomTextTheme(this.context)
      : _defaultTextTheme = Theme.of(context).textTheme;

  TextTheme getCustomTextTheme() {
    return TextTheme(
      headline1: _defaultTextTheme.headline1!.copyWith(
        color: CustomColorScheme.textColor,
      ),
      headline2: _defaultTextTheme.headline2!.copyWith(
        color: CustomColorScheme.textColor,
      ),
      headline3: _defaultTextTheme.headline3!.copyWith(
        color: CustomColorScheme.textColor,
      ),
      headline4: _defaultTextTheme.headline4!.copyWith(
        color: CustomColorScheme.textColor,
      ),
      headline5: _defaultTextTheme.headline5!.copyWith(
        color: CustomColorScheme.textColor,
      ),
      headline6: _defaultTextTheme.headline6!.copyWith(
        color: CustomColorScheme.textColor,
      ),
      subtitle1: _defaultTextTheme.subtitle1!.copyWith(
        color: CustomColorScheme.textColor,
      ),
      subtitle2: _defaultTextTheme.subtitle2!.copyWith(
        color: CustomColorScheme.textColor,
      ),
      bodyText1: _defaultTextTheme.bodyText1!,
      bodyText2: _defaultTextTheme.bodyText2!,
      caption: _defaultTextTheme.caption!.copyWith(
        color: CustomColorScheme.textColor,
      ),
      button: _defaultTextTheme.button!.copyWith(
        color: CustomColorScheme.textColor,
      ),
      overline: _defaultTextTheme.overline!.copyWith(
        color: CustomColorScheme.textColor,
      ),
    );
  }
}
