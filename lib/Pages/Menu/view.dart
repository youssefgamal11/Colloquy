import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Drawer/view.dart';

class MenuItem {
  MenuItem(String s);

  static var home = MenuItem('Home');
  static var profile = MenuItem('Profile');
  static var contacts = MenuItem('Contacts');
  static var calls = MenuItem('Calls');
  static var settings = MenuItem('Settings');
  static var myList = <MenuItem>[
    home,
    profile,
    contacts,
    calls,
    settings,
  ];
}

class MenuScreen extends GetView<MyDrawerController> {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xffF2F2FE),
      // body: SafeArea(
      //   child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      //     const Spacer(),
      //     const Spacer(
      //       flex: 2,
      //     )
      //   ]),
      // ),
    );
  }
}
