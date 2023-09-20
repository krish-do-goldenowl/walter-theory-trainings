import 'package:flutter/material.dart';

class OrdinalNumberText extends StatelessWidget {
  const OrdinalNumberText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          const TextSpan(
            text: "First ",
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          const WidgetSpan(
            child: Icon(
              Icons.arrow_forward_rounded,
              color: Colors.orange,
            ),
          ),
          const TextSpan(
            text: " second ",
            style: TextStyle(fontSize: 30, color: Colors.grey),
          ),
          WidgetSpan(
            child: Container(
              width: 100,
              height: 100,
              color: Colors.orange,
            ),
          ),
          const TextSpan(
            text: " third",
            style: TextStyle(fontSize: 30, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
