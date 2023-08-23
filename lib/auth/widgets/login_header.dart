import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(height: 30),
          CircleAvatar(
            radius: 60,
            backgroundColor: Colors.transparent,
            child: Image.asset(
              "assets/icons/logo.png",
            ),
          ),
          // const SizedBox(height: 10),
          Text(
            'Squatva',
            style: Theme.of(context).textTheme.headline5!.copyWith(fontSize: 40, fontWeight: FontWeight.w300),
          ),
        ],
      ),
    );
  }
}
