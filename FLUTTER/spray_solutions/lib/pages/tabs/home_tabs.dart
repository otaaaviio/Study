import 'package:flutter/material.dart';
import 'package:spray_solutions/pages/tabs/widgets/home_menu.dart';
import 'package:spray_solutions/pages/tabs/widgets/profile_menu.dart';

class TabsPage extends StatefulWidget {
  const TabsPage({super.key});

  @override
  State<TabsPage> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  int select = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> tabs = [
      const HomeMenu(),
      const ProfileMenu()
    ];

    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            tabs[select],
            Expanded(child: Container()),
            Container(
              height: 50,
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(width: 1, color: Colors.black),
                ),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTapDown: (details) {
                        setState(() {
                          select = 0;
                        });
                      },
                      child: Image.asset(
                        'assets/images/icon-home.png',
                        color: select == 0 ? Colors.green.shade900 : null,
                      ),
                    ),
                    GestureDetector(
                      onTapDown: (details) {
                        setState(() {
                          select = 1;
                        });
                      },
                      child: Image.asset(
                        'assets/images/icon-profile.png',
                          color: select == 1 ? Colors.green.shade900 : null,
                      ),
                    )
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
