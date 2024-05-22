import 'package:flutter/material.dart';

class PendingWidget extends StatelessWidget {
  final Color? customColor;

  const PendingWidget({this.customColor, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(color: customColor);
  }
}
