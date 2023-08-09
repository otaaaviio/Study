import 'package:flutter/material.dart';
import 'package:spray_solutions/pages/stock/graphic_screen.dart';
import 'package:spray_solutions/pages/login/login_screen.dart';
import 'package:spray_solutions/pages/registration/register_screen.dart';
import 'package:spray_solutions/pages/registration/successfully_register.dart';
import 'package:spray_solutions/pages/tabs/home_tabs.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/tabs',
      routes: {
        '/': (context) => const Login(),
        '/register': (context) => const RegisterPage(),
        '/sucessRegister': (context) => const SucessfullyRegister(),
        '/stock': (context) => const GraphicScreen(),
        '/tabs':(context) => const TabsPage(),
      },
    );
  }
}