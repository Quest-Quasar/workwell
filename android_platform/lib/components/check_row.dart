import 'package:flutter/material.dart';

class MyCheckbox extends StatefulWidget {
  final String text;

  const MyCheckbox({
    required this.text,
  });

  @override
  State<MyCheckbox> createState() => _MyCheckboxState();
}

class _MyCheckboxState extends State<MyCheckbox> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 16,
          height: 16,
          child: Checkbox(
            value: isChecked,
            onChanged: (bool? value) {
              setState(() {
                isChecked = value ?? false;
              });
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                color: Theme.of(context)
                    .colorScheme
                    .inversePrimary
                    .withOpacity(0.5),
                width: 2.0,
              ),
            ),
            activeColor: Theme.of(context).colorScheme.inversePrimary,
            checkColor: Theme.of(context).colorScheme.background,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          widget.text,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            color: isChecked
                ? Theme.of(context).colorScheme.inversePrimary
                : Theme.of(context).colorScheme.inversePrimary.withOpacity(0.5),
          ),
        ),
      ],
    );
  }
}
