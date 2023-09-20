import 'package:flutter/material.dart';

class OptionButton extends StatelessWidget {
  const OptionButton({
    super.key,
    required this.title,
    required this.onTap,
    required this.isChoose,
  });

  final String title;
  final VoidCallback onTap;
  final bool isChoose;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: isChoose ? Colors.blue.withOpacity(0.2) : Colors.white,
        padding: const EdgeInsets.all(10),
        child: Text(title),
      ),
    );
  }
}
