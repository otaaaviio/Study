import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:spray_solutions/widgtes/inputs.dart';
import '../widgtes/button.dart';

class RegisterBloc3 extends StatefulWidget {
  final Function(int) onChanged;
  const RegisterBloc3({super.key, required this.onChanged});

  @override
  State<RegisterBloc3> createState() => _RegisterBloc3State();
}

class _RegisterBloc3State extends State<RegisterBloc3> {
  var maskDDD =
      MaskTextInputFormatter(mask: '##', filter: {'#': RegExp(r"^[0-9]+$")});

  var maskCel = MaskTextInputFormatter(
      mask: '# ####-####', filter: {'#': RegExp(r"^[0-9]+$")});

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
                InputMask(
                    onChanged: (value) {},
                    labelText: '',
                    width: 50,
                    mask: maskDDD),
                InputMask(
                    onChanged: (value) {},
                    labelText: '9 9999 9999',
                    width: screenWidth - 90,
                    mask: maskCel)
              ],
            ),
            Container(
              constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height - 204),
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
                      Navigator.of(context)
                          .pushReplacementNamed('/sucessRegister');
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
