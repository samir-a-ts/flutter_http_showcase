import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final ValueChanged<String> onInput;

  final String label;

  const TextInput({
    required this.onInput,
    required this.label,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onInput,
      decoration: InputDecoration(
        labelText: label,
      ),
    );
  }
}
