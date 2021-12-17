import 'package:evenue/common/ui/custom_color_scheme.dart';
import 'package:flutter/material.dart';

CustomTextStyles customTextStyles = CustomTextStyles();

class CustomTextStyles {
  TextStyle get cardTitle => TextStyle(
    color: Colors.black,
    fontSize: 18,
  );

  TextStyle get cardDescription => TextStyle(
    color: Colors.black45,
    fontSize: 15,
  );

  TextStyle get price => TextStyle(
    color: Colors.black,
    fontSize: 15,
  );

  TextStyle get cardDate => TextStyle(
    color: CustomColorScheme.primaryColor,
  );
}