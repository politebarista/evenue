import 'package:flutter/material.dart';

class IndentWidget extends StatelessWidget {
  final Widget child;

  const IndentWidget({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double padding = 16;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: child,
    );
  }
}
