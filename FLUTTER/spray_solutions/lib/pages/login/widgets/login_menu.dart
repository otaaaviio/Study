import 'package:flutter/material.dart';

class LoginBloc extends StatefulWidget {
  const LoginBloc({super.key});

  @override
  State<LoginBloc> createState() => _LoginBlocState();
}

class _LoginBlocState extends State<LoginBloc> {
  String email = '';
  String password = '';
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          onChanged: (value) {
            setState(() {
              email = value;
            });
          },
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            labelText: 'E-mail',
            focusColor: Colors.green,
            contentPadding: EdgeInsets.all(8.0),
            labelStyle: TextStyle(fontSize: 10),
            constraints: BoxConstraints(maxWidth: 200.0),
          ),
        ),
        TextField(
          onChanged: (value) {
            setState(() {
              password = value;
            });
          },
          obscureText: !showPassword,
          decoration: InputDecoration(
            labelText: 'Senha',
            focusColor: Colors.green,
            contentPadding: const EdgeInsets.all(8.0),
            constraints: const BoxConstraints(maxWidth: 200.0),
            labelStyle: const TextStyle(fontSize: 10),
            suffixIcon: IconButton(
              icon: Icon(
                showPassword ? Icons.visibility : Icons.visibility_off,
                size: 18,
              ),
              onPressed: () {
                setState(() {
                  showPassword = !showPassword;
                });
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: TextButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.green.shade900,
            ),
            child: const Padding(
              padding: EdgeInsets.only(left: 25, right: 25, bottom: 1),
              child: Text('Entrar'),
            ),
            onPressed: () {
              if(email != '' && password != '') {
                Navigator.of(context).pushReplacementNamed('/stock');
              }
            },
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height - 456,
          alignment: Alignment.bottomCenter,
          child: Row(
            verticalDirection: VerticalDirection.down,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text('Criado por '),
              Image.asset(
                'assets/images/spraySolutions.png',
                scale: 2.5,
              )
            ],
          ),
        )
      ],
    );
  }
}