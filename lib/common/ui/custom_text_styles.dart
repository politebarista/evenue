import 'package:evenue/common/ui/custom_color_scheme.dart';
import 'package:flutter/material.dart';

CustomTextStyles customTextStyles = CustomTextStyles();

class CustomTextStyles {
  TextStyle get title => TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w600,
    fontSize: 24,
  );

  TextStyle get description => TextStyle(
    color: Colors.black,
    fontSize: 16,
  );

  TextStyle get cardTitle => TextStyle(
    color: Colors.black,
    fontSize: 18,
  );

  TextStyle get cardDescription => TextStyle(
    color: Colors.black45,
    fontSize: 15,
    height: 1,
  );

  TextStyle get price => TextStyle(
    color: Colors.black,
    fontSize: 15,
  );

  TextStyle get cardDate => TextStyle(
    color: CustomColorScheme.primaryColor,
  );

  TextStyle get coloredButton => TextStyle(
    color: CustomColorScheme.textColor,
    fontSize: 18,
  );

  TextStyle get transparentButton => TextStyle(
    color: CustomColorScheme.primaryColor,
    fontSize: 18,
  );
}