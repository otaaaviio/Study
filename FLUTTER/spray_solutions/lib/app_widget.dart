import 'package:flutter/material.dart';
import 'package:spray_solutions/screens/graphic_screen.dart';
import 'package:spray_solutions/screens/login_screen.dart';
import 'package:spray_solutions/screens/register_screen.dart';
import 'package:spray_solutions/screens/successfully_register.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/graphic',
      routes: {
        '/': (context) => const Login(),
        '/register': (context) => const RegisterPage(),
        '/sucessRegister': (context) => const SucessfullyRegister(),
        '/graphic': (context) => const GraphicScreen(),
      },
    );
  }
}