import 'package:flutter/material.dart';
import '../blocs/register_bloc_1.dart';
import '../blocs/register_bloc_2.dart';
import '../blocs/register_bloc_3.dart';

class RegisterPage extends StatefulWidget {
  final String? email;
  final String? password;
  const RegisterPage({super.key, this.email, this.password});
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  int ref = 1;
  late String name;
  late String lastName;
  Map<String, dynamic> locationData = {};

  Widget _select({required int page}) {
    return AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.only(left: 5),
        width: (page == ref) ? 15 : 5,
        height: 5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: (page == ref) ? Colors.brown : Colors.grey,
        ));
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> registerPages = [
      RegisterBloc1(
        onChanged: (page) {
          setState(() {
            ref = page;
          });
        },
        onNameAndLastNameChanged: (name, lastName) {
          setState(() {
            this.name = name;
            this.lastName = lastName;
          });
        },
      ),
      RegisterBloc2(
        onChanged: (page) {
          setState(() {
            ref = page;
          });
        },
        onLocationChanged: (location) {
          setState(() {
            locationData = location;
          });
        },
      ),
      RegisterBloc3(
        onChanged: (page) {
          setState(() {
            ref = page;
          });
        },
      ),
    ];

    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.green.shade900,
          ),
          TextButton(
              onPressed: () {
              },
              child: Text('aaa')),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              alignment: Alignment.topCenter,
              height: MediaQuery.of(context).size.height - 85,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
              ),
              child: Column(
                children: [
                  Tab(
                    height: 15,
                    iconMargin: const EdgeInsets.only(left: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _select(page: 1),
                        _select(page: 2),
                        _select(page: 3),
                      ],
                    ),
                  ),
                  registerPages[ref - 1],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
