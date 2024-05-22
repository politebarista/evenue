import 'package:evenue/common/constants.dart';
import 'package:evenue/common/ui/custom_color_scheme.dart';
import 'package:evenue/common/ui/custom_text_styles.dart';
import 'package:evenue/common/ui/evenue_button_type.dart';
import 'package:flutter/material.dart';

class EvenueButton extends StatelessWidget {
  final Function()? onTap;
  /// The text will be displayed on the button if there is no [textSubstitute]
  final String text;
  /// This substitute will be used instead of the [text]
  final Widget? textSubstitute;
  final EvenueButtonType type;

  late final _buttonColor;
  late final _textStyle;

  EvenueButton({
    required this.onTap,
    required this.text,
    this.type = EvenueButtonType.colored,
    this.textSubstitute,
    Key? key,
  }) : super(key: key) {
    switch (type) {
      case EvenueButtonType.colored:
        _buttonColor = CustomColorScheme.primaryColor;
        _textStyle = customTextStyles.coloredButton;
        break;
      case EvenueButtonType.transparent:
        _buttonColor = Colors.transparent;
        _textStyle = customTextStyles.transparentButton;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: MaterialButton(
        height: 59,
        onPressed: onTap,
        child: textSubstitute ?? Text(
          text,
          style: _textStyle,
        ),
        color: _buttonColor,
        disabledColor: CustomColorScheme.disabledColor,
        elevation: 0,
        highlightElevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}
