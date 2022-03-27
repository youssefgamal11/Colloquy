import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F2FE),
      body: SafeArea(
          child: Column(
        children: const [
          Icon(Icons.add),
          Icon(Icons.radar),
        ],
      )),
    );
  }
}
