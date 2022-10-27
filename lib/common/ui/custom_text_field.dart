import 'package:evenue/common/constants.dart';
import 'package:evenue/common/ui/custom_color_scheme.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? label;
  final bool obscureText;

  const CustomTextField({
    required this.controller,
    this.label,
    this.obscureText = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final preparedLabel = label == null ? null : Text(label!);

    return TextFormField(
      controller: controller,
      style: TextStyle(
        color: Colors.black,
      ),
      obscureText: obscureText,
      decoration: InputDecoration(
        label: preparedLabel,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: CustomColorScheme.secondaryColor,
          ),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: CustomColorScheme.secondaryColor,
          ),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: CustomColorScheme.primaryColor,
          ),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}
