import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final String labelText;
  final Function(String) onChanged;
  final double? width;

  const Input(
      {super.key, required this.onChanged, required this.labelText, this.width});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: SizedBox(
        width: width,
        height: 45,
        child: TextField(
          onChanged: onChanged,
          decoration: InputDecoration(
            filled: true,
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green.shade900, width: 2)),
            fillColor: Colors.blue.shade50,
            labelText: labelText,
            contentPadding: const EdgeInsets.only(left: 15),
            labelStyle: const TextStyle(fontSize: 10),
            border: const OutlineInputBorder(),
          ),
        ),
      ),
    );
  }
}
