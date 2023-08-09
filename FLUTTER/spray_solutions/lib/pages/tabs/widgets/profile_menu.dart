import 'package:flutter/material.dart';
import 'package:spray_solutions/widgets/button.dart';

class ProfileMenu extends StatefulWidget {
  const ProfileMenu({super.key});

  @override
  State<ProfileMenu> createState() => _ProfileMenuState();
}

class _ProfileMenuState extends State<ProfileMenu> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    Widget text({required String text, bool? name}) {
      name ??= false;
      return SizedBox(
        height: name ? 50 : 30,
        child: Text(
          text,
          textAlign: name ? TextAlign.center : TextAlign.left,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      );
    }

    return Column(
      children: [
        Image.asset(
          'assets/images/icon-profile.png',
          scale: 0.1,
        ),
        Container(
          width: screenWidth - 20,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.green,
          ),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                text(text: 'Exemple Name', name: true),
                text(text: 'Telefone: 55 9 9999 9999'),
                text(text: 'Email: exemple@exemple.com'),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 15.0),
          child: ButtonRegister(
              width: MediaQuery.of(context).size.width - 20,
              height: 50,
              onChanged: () {},
              text: 'Configurações'),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 15.0),
          child: ButtonRegister(
              width: MediaQuery.of(context).size.width - 20,
              height: 50,
              onChanged: () {
                Navigator.of(context).pushReplacementNamed('/');
              },
              text: 'Sair'),
        )
      ],
    );
  }
}
