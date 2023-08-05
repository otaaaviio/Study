import 'package:flutter/material.dart';
import 'package:spray_solutions/widgtes/button.dart';

import '../widgtes/input_register.dart';

class RegisterBloc1 extends StatefulWidget {
  final Function(int) onChanged;
  const RegisterBloc1({super.key, required this.onChanged});

  @override
  State<RegisterBloc1> createState() => RegisterBloc1State();
}

class RegisterBloc1State extends State<RegisterBloc1> {
  String name = '';
  String lastName = '';

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 10.0, top: 8.0),
          child: const Text(
            'Primeiro, vamos conhecer você',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
        ),
        Input(
            onChanged: (value) {
              setState(() {
                name = value;
              });
            },
            labelText: 'Qual seu nome?'),
        Input(
            onChanged: (value) {
              setState(() {
                lastName = value;
              });
            },
            labelText: ('E o seu sobrenome?')),
        Container(height: MediaQuery.of(context).size.height - 294),
        ButtonRegister(
          width: screenWidth - 10,
          height: 45,
          onChanged: () {
            widget.onChanged(2);
          },
          text: 'Próximo',
        ),
      ],
    );
  }
}
