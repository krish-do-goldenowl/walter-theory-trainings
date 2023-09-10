import 'package:flutter/material.dart';

class NumberText extends StatelessWidget {
  const NumberText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: const TextSpan(
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w500,
          fontSize: 20,
        ),
        children: [
          TextSpan(text: "One "),
          TextSpan(
            text: "Two",
            style: TextStyle(
              decoration: TextDecoration.underline,
              fontStyle: FontStyle.italic,
              fontSize: 30,
            ),
          ),
          TextSpan(text: " Three "),
          TextSpan(text: "Four "),
          TextSpan(
            text: "Five ",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.red,
              fontSize: 30,
            ),
          ),
        ],
      ),
    );
  }
}
