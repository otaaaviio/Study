import 'package:flutter/material.dart';
import 'package:spray_solutions/widgets/button.dart';
import 'dart:core';

import '../../../widgets/inputs.dart';

class RegisterBloc1 extends StatefulWidget {
  final Function(int) onChanged;
  final Function(String, String, String) onNameAndProfessionChanged;
  const RegisterBloc1(
      {super.key,
      required this.onChanged,
      required this.onNameAndProfessionChanged});

  @override
  State<RegisterBloc1> createState() => RegisterBloc1State();
}

class RegisterBloc1State extends State<RegisterBloc1> {
  String name = '';
  String lastName = '';
  String profession = '';

  Widget titleContainer({required String text}) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: 10.0, top: 8.0),
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        titleContainer(text: 'Primeiro vamos conhecer voce'),
        InputDefault(
          onChanged: (value) {
            setState(() {
              name = value;
              widget.onNameAndProfessionChanged(name, lastName, profession);
            });
          },
          labelText: 'Qual seu nome?',
        ),
        InputDefault(
          onChanged: (value) {
            setState(() {
              lastName = value;
              widget.onNameAndProfessionChanged(name, lastName, profession);
            });
          },
          labelText: ('E o seu sobrenome?'),
        ),
        InputDefault(
          onChanged: (value) {
            setState(() {
              profession = value;
              widget.onNameAndProfessionChanged(name, lastName, profession);
            });
          },
          labelText: 'Qual sua profissão?',
        ),
        Container(height: MediaQuery.of(context).size.height - 351),
        ButtonRegister(
          width: screenWidth - 10,
          height: 45,
          onChanged: () {
            if(name != '' && lastName != '' && profession != '') {
            widget.onChanged(2);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Complete todos os campos.')),
                );
            }
          },
          text: 'Próximo',
        ),
      ],
    );
  }
}
