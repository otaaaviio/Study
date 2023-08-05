import 'package:flutter/material.dart';

class SucessfullyRegister extends StatelessWidget {
  const SucessfullyRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(color: Colors.green.shade900),
        Center(
          child: Container(
            width: MediaQuery.of(context).size.width - 10,
            height: MediaQuery.of(context).size.height / 1.3,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: Image.asset(
                  'assets/images/Icon-192.png',
                  scale: 2,
                  alignment: Alignment.center,
                ),
              ),
              const Padding(
                padding:  EdgeInsets.only(bottom: 20),
                child:  Text(
                  'Bem vindo',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                width: 200,
                child: Text(
                  'Esse aplicativo é uma tecnologia desenvolvida pela Spray Solutions, pensada para otimizar a vida de seus clientes',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12, ),
                ),
              ),
              Expanded(
                child: Image.asset(
                'assets/images/spraySolutions.png',
                scale: 1.5,
                          ),
              )
            ]),
          ),
        )
      ]),
    );
  }
}
