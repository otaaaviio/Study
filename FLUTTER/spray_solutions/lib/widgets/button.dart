import 'package:flutter/material.dart';

class ButtonRegister extends StatelessWidget {
  final double width, height;
  final String text;
  final Function() onChanged;
  const ButtonRegister({super.key, required this.width, required this.height, required this.onChanged, required this.text});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onChanged,
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all<Color>(Colors.green.shade900),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        minimumSize: MaterialStateProperty.all<Size>(Size(width, height)),
      ),
      child: Text(text, style: const TextStyle(fontSize: 12)),
    );
  }
}
