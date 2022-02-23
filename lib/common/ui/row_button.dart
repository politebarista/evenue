import 'package:evenue/common/ui/custom_text_styles.dart';
import 'package:evenue/common/ui/indent_widget.dart';
import 'package:flutter/material.dart';

class RowButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const RowButton({
    required this.text,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: SizedBox(
        width: double.infinity,
        child: IndentWidget(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(text, style: customTextStyles.cardTitle),
          ),
        ),
      ),
      onTap: onTap,
    );
  }
}
