import 'package:flutter/material.dart';

class ViewOptionDropdown<T> extends StatelessWidget {
  const ViewOptionDropdown({
    super.key,
    required this.title,
    required this.value,
    required this.items,
    required this.onChanged,
    this.nameItems,
  });

  final String title;
  final Function(T? state) onChanged;
  final List<T> items;
  final List<String>? nameItems;
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
              .asMap()
              .map((index, e) => MapEntry(
                  index,
                  DropdownMenuItem<T>(
                    value: e,
                    child: nameItems == null
                        ? Text("$e".split(".").last)
                        : Text(nameItems![index]),
                  )))
              .values
              .toList(),
          onChanged: onChanged,
        ),
      ],
    );
  }
}
