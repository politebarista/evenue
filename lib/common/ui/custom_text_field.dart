import 'package:evenue/common/constants.dart';
import 'package:evenue/common/ui/custom_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? label;
  final bool obscureText;
  final List<TextInputFormatter>? inputFormatters;
  final String? hintText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final bool? enabled;

  const CustomTextField({
    required this.controller,
    this.label,
    this.obscureText = false,
    this.inputFormatters,
    this.hintText,
    this.keyboardType,
    this.validator,
    this.enabled,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final preparedLabel = label == null ? null : Text(label!);

    return TextFormField(
      controller: controller,
      style: TextStyle(
        color: enabled ?? true ? Colors.black : null,
      ),
      obscureText: obscureText,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      validator: validator,
      enabled: enabled,
      decoration: InputDecoration(
        label: preparedLabel,
        hintText: hintText,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: CustomColorScheme.secondaryColor,
          ),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        // ignore: no-equal-arguments
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
