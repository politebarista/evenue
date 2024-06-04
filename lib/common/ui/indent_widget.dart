import 'package:flutter/material.dart';

class IndentWidget extends StatelessWidget {
  static const double indent = 12;

  final Widget child;

  const IndentWidget({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: indent),
      child: child,
    );
  }
}
