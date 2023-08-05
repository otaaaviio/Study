import 'package:flutter/material.dart';

class RegisterBloc extends StatefulWidget {
  const RegisterBloc({super.key});

  @override
  State<RegisterBloc> createState() => _RegisterBlocState();
}

class _RegisterBlocState extends State<RegisterBloc> {
  String email = '';
  String password = '';
  String confirmPassword = '';
  bool showPassword = false;
  bool showPassword_2 = false;
  
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
                }),
          ),
        ),
        TextField(
          onChanged: (value) {
            setState(() {
              confirmPassword = value;
            });
          },
          obscureText: !showPassword_2,
          decoration: InputDecoration(
            labelText: 'Confirme sua senha',
            focusColor: Colors.green,
            contentPadding: const EdgeInsets.all(8.0),
            constraints: const BoxConstraints(maxWidth: 200.0),
            labelStyle: const TextStyle(fontSize: 10),
            suffixIcon: IconButton(
                icon: Icon(
                  showPassword_2 ? Icons.visibility : Icons.visibility_off,
                  size: 18,
                ),
                onPressed: () {
                  setState(() {
                    showPassword_2 = !showPassword_2;
                  });
                }),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/register');
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.green.shade900,
            ),
            child: const Padding(
              padding: EdgeInsets.only(left: 25, right: 25, bottom: 1),
              child: Text('Cadastrar'),
            ),
          ),
        ),
      ],
    );
  }
}