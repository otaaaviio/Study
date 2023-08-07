import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class InputMask extends StatelessWidget {
  final String labelText;
  final Function(String) onChanged;
  final double? width;
  final MaskTextInputFormatter mask;

  const InputMask(
      {super.key,
      required this.onChanged,
      required this.labelText,
      this.width,
      required this.mask});

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
          inputFormatters: [mask],
        ),
      ),
    );
  }
}

class InputDigits extends StatelessWidget {
  final String labelText;
  final Function(String) onChanged;
  final double? width;

  const InputDigits(
      {super.key,
      required this.onChanged,
      required this.labelText,
      this.width});

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
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        ),
      ),
    );
  }
}

class InputDefault extends StatelessWidget {
  final String labelText;
  final Function(String) onChanged;
  final double? width;

  const InputDefault({
    super.key,
    required this.onChanged,
    required this.labelText,
    this.width,
  });

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
