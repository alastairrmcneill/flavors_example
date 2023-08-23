import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SocialSignIn extends StatelessWidget {
  final Color backgroundColor;
  final Color borderColor;
  final Widget icon;
  final AsyncCallback function;
  const SocialSignIn({
    super.key,
    required this.backgroundColor,
    required this.borderColor,
    required this.icon,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await function();
      },
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(
            color: borderColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Center(
            child: icon,
          ),
        ),
      ),
    );
  }
}
