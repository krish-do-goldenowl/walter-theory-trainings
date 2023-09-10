import 'package:flutter/material.dart';

class GoogleText extends StatelessWidget {
  const GoogleText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: const TextSpan(
        style: TextStyle(fontSize: 35),
        children: [
          TextSpan(
            text: "G",
            style: TextStyle(
              color: Color(0xFF2196F3),
              backgroundColor: Color(0xFFF8BBD0),
            ),
          ),
          TextSpan(
            text: "o",
            style: TextStyle(
              color: Color(0xFFF44336),
              backgroundColor: Color(0xFFFCE4EC),
              fontWeight: FontWeight.bold,
              fontSize: 40,
            ),
          ),
          TextSpan(
            text: "o",
            style: TextStyle(
              color: Color(0xFFFFC107),
              backgroundColor: Color(0xFFF48FB1),
              fontWeight: FontWeight.bold,
              fontSize: 40,
            ),
          ),
          TextSpan(
            text: "g",
            style: TextStyle(
              color: Color(0xFF2196F3),
              backgroundColor: Color(0xFFF8BBD0),
            ),
          ),
          TextSpan(
            text: "l",
            style: TextStyle(
              color: Color(0xFF4CAF50),
              backgroundColor: Color(0xFFFCE4EC),
              fontWeight: FontWeight.bold,
              fontSize: 40,
            ),
          ),
          TextSpan(
            text: "e",
            style: TextStyle(
              color: Color(0xFFF44336),
              backgroundColor: Color(0xFFF8BBD0),
            ),
          ),
        ],
      ),
    );
  }
}
