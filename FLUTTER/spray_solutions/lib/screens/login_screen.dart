import 'package:flutter/material.dart';
import 'package:spray_solutions/blocs/login_bloc.dart';
import 'package:spray_solutions/blocs/register_bloc.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => LoginState();
}

class LoginState extends State<Login> {
  bool _login = true;
  bool registerShowPassword = false;
  bool registerShowPassword_2 = false;
  String registerEmail = '';
  String registerPassword = '';
  String registerConfirmPassword = '';

  Widget _select(String text, bool type) {
    return GestureDetector(
      onTap: () {
        if (type == false) {
          setState(() {
            _login = !_login;
          });
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: const TextStyle(fontSize: 12.0),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Container(
              height: type ? 1.5 : 0.0,
              width: 60.0,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.green.shade900, Colors.red],
                begin: Alignment.center,
                end: Alignment.bottomCenter,
                transform: const GradientRotation(1),
              ),
            ),
          ),
          Center(
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              width: MediaQuery.of(context).size.width - 20,
              height: MediaQuery.of(context).size.height - 170,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Image.asset(
                      'assets/images/Icon-192.png',
                      scale: 2,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _select('Entrar', _login),
                        _select('Cadastrar', !_login),
                      ],
                    ),
                  ),
                  _login ? const LoginBloc() : const RegisterBloc(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
