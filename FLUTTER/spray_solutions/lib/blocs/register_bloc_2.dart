import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:spray_solutions/widgtes/inputs.dart';
import '../widgtes/button.dart';
import 'package:search_cep/search_cep.dart';

class RegisterBloc2 extends StatefulWidget {
  final Function(int) onChanged;
  final Function(Map<String, dynamic>) onLocationChanged;
  const RegisterBloc2(
      {super.key, required this.onChanged, required this.onLocationChanged});

  @override
  State<RegisterBloc2> createState() => RegisterBloc2State();
}

class RegisterBloc2State extends State<RegisterBloc2> {
  Map<String, dynamic> location = {
    'cep': '',
    'rua': '',
    'numero': '',
    'bairro': '',
    'complemento': '',
    'cidade': '',
    'estado': '',
  };

  var maskCEP = MaskTextInputFormatter(
      mask: '########',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

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
            InputMask(
              onChanged: (value) async {
                location['cep'] = value;

                if (value.length == 8) {
                  final viaCep = PostmonSearchCep();

                  try {
                    final result = await viaCep.searchInfoByCep(cep: value);

                    String? rua =
                        result.fold((l) => 'Erro', (info) => info.logradouro);
                    String? numero =
                        result.fold((l) => 'Erro', (info) => info.logradouro);
                    String? bairro =
                        result.fold((l) => 'Erro', (info) => info.bairro);
                    String? cidade =
                        result.fold((l) => 'Erro', (info) => info.cidade);
                    String? estado =
                        result.fold((l) => 'Erro', (info) => info.estado);

                    setState(() {
                      location['rua'] = rua;
                      location['numero'] = numero;
                      location['bairro'] = bairro;
                      location['cidade'] = cidade;
                      location['estado'] = estado;
                    });

                    widget.onLocationChanged(location);
                  } catch (e) {
                    print(e);
                  }
                }
              },
              labelText: 'CEP',
              mask: maskCEP,
            ),
            Inputtest(
              onChanged: (value) {
                location['rua'] = value;
                widget.onLocationChanged(location);
              },
              labelText: 'Rua',
              value: location['rua'],
            ),
            Row(
              children: [
                InputDigits(
                  onChanged: (value) {
                    location['numero'] = value;
                    widget.onLocationChanged(location);
                  },
                  labelText: 'N°',
                  width: 100,
                ),
                InputDefault(
                  onChanged: (value) {
                    location['bairro'] = value;
                    widget.onLocationChanged(location);
                  },
                  labelText: 'Bairro',
                  width: screenWidth - 140,
                ),
              ],
            ),
            InputDefault(
              onChanged: (value) {
                location['complemento'] = value;
                widget.onLocationChanged(location);
              },
              labelText: 'Complemento',
            ),
            Row(
              children: [
                InputDefault(
                  onChanged: (value) {
                    location['cidade'] = value;
                    widget.onLocationChanged(location);
                  },
                  labelText: 'Cidade',
                  width: 150,
                ),
                InputDefault(
                  onChanged: (value) {
                    location['estado'] = value;
                    widget.onLocationChanged(location);
                  },
                  labelText: 'Estado',
                  width: screenWidth - 190,
                ),
              ],
            ),
            Container(
              constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height - 424),
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
