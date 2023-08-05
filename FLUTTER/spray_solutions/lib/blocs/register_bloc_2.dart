import 'package:flutter/material.dart';
import 'package:spray_solutions/widgtes/input_register.dart';

import '../widgtes/button.dart';

class RegisterBloc2 extends StatefulWidget {
  final Function(int) onChanged;
  const RegisterBloc2({super.key, required this.onChanged});

  @override
  State<RegisterBloc2> createState() => RegisterBloc2State();
}

class RegisterBloc2State extends State<RegisterBloc2> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 10.0, top: 8.0),
              child: const Text(
                'Endereço',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),
            ),
            Input(onChanged: (text) {}, labelText: 'CEP'),
            Input(onChanged: (text) {}, labelText: 'Rua'),
            Row(
              children: [
                Input(onChanged: (text) {}, labelText: 'N°', width: 100),
                Input(
                    onChanged: (text) {},
                    labelText: 'Bairro',
                    width: screenWidth - 140),
              ],
            ),
            Input(onChanged: (text) {}, labelText: 'Complemento'),
            Row(
              children: [
                Input(onChanged: (text) {}, labelText: 'Cidade', width: 150),
                Input(
                    onChanged: (text) {},
                    labelText: 'Estado',
                    width: screenWidth - 190),
              ],
            ),
            Container(
              constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height - 424),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ButtonRegister(
                    width: screenWidth / 2 - 10,
                    height: 45,
                    onChanged: () {
                      widget.onChanged(1);
                    },
                    text: 'Voltar',
                  ),
                  ButtonRegister(
                    width: screenWidth / 2 - 10,
                    height: 45,
                    onChanged: () {
                      widget.onChanged(3);
                    },
                    text: 'Próximo',
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
