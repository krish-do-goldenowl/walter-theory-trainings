import 'package:flutter/material.dart';

class ViewOptionDropdown<T> extends StatelessWidget {
  const ViewOptionDropdown({
    super.key,
    required this.title,
    required this.value,
    required this.items,
    required this.onChanged,
  });

  final String title;
  final Function(T? state) onChanged;
  final List<T> items;
  final T value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        DropdownButton<T>(
          icon: const Icon(Icons.keyboard_arrow_down_rounded),
          value: value,
          items: items
              .map((e) => DropdownMenuItem<T>(
                    value: e,
                    child: Text(e.toString().split(".").last),
                  ))
              .toList(),
          onChanged: onChanged,
        ),
      ],
    );
  }
}
