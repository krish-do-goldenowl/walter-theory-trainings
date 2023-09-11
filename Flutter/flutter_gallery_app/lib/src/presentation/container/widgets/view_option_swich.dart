import 'package:flutter/material.dart';

class ViewOptionSwich extends StatelessWidget {
  const ViewOptionSwich({
    super.key,
    required this.onChanged,
    required this.title,
    required this.value,
  });

  final String title;
  final Function(bool value) onChanged;
  final bool value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text(title), Switch(value: value, onChanged: onChanged)],
    );
  }
}
