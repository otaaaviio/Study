import 'package:flutter/material.dart';
import 'package:spray_solutions/widgets/button.dart';

class HomeMenu extends StatefulWidget {
  const HomeMenu({super.key});

  @override
  State<HomeMenu> createState() => _HomeMenuState();
}

class _HomeMenuState extends State<HomeMenu> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: ButtonRegister(
              width: screenWidth,
              height: 50,
              onChanged: () {
                Navigator.of(context).pushReplacementNamed('/stock');
              },
              text: 'Estoque'),
        )
      ],
    );
  }
}
