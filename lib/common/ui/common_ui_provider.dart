import 'package:flutter/material.dart';

CommonUiProvider commonUiProvider = CommonUiProvider();

class CommonUiProvider {
  final List<BoxShadow> shadow = [
    BoxShadow(
      color: Colors.black.withOpacity(0.3),
      blurRadius: 5,
      spreadRadius: 1,
    ),
  ];

  final divider = Divider(thickness: 1);
}