import 'package:flutter/material.dart';

class TextDivider extends StatelessWidget {
  final String text;
  const TextDivider({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          flex: 1,
          child: Divider(
            thickness: 1,
            indent: 5,
            endIndent: 5,
          ),
        ),
        Text(text),
        const Expanded(
          flex: 1,
          child: Divider(
            thickness: 1,
            indent: 5,
            endIndent: 5,
          ),
        ),
      ],
    );
  }
}
