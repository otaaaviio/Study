import 'package:flutter/material.dart';
import 'package:spray_solutions/widgtes/input_register.dart';

import '../widgtes/button.dart';

class RegisterBloc3 extends StatefulWidget {
  final Function(int) onChanged;
  const RegisterBloc3({super.key, required this.onChanged});

  @override
  State<RegisterBloc3> createState() => _RegisterBloc3State();
}

class _RegisterBloc3State extends State<RegisterBloc3> {
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
                'Por último, um contato',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),
            ),
            Row(
              children: [
                Input(onChanged: (value) {}, labelText: '', width: 50),
                Padding(
                  padding: const EdgeInsets.only(right: 10, top: 10),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width - 80,
                    height: 45,
                    child: TextField(
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.phone_enabled),
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.green.shade900, width: 2)),
                        fillColor: Colors.blue.shade50,
                        labelText: '9 9999 9999',
                        contentPadding: const EdgeInsets.only(left: 15),
                        labelStyle: const TextStyle(fontSize: 10),
                        border: const OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height - 204),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ButtonRegister(
                    width: screenWidth / 2 - 10,
                    height: 45,
                    onChanged: () {
                      widget.onChanged(2);
                    },
                    text: 'Voltar',
                  ),
                  ButtonRegister(
                    width: screenWidth / 2 - 10,
                    height: 45,
                    onChanged: () {
                      Navigator.of(context).pushReplacementNamed('/sucessRegister');
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