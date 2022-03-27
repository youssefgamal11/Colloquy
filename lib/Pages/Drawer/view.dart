import 'package:chat_app/Pages/Home/view.dart';
import 'package:chat_app/Pages/menu/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class DrawerScreen extends StatelessWidget {
  DrawerScreen({Key? key}) : super(key: key);
  final drawerController = ZoomDrawerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ZoomDrawer(
        controller: drawerController,
        style: DrawerStyle.Style1,
        showShadow: true,
        angle: 0,
        backgroundColor: const Color(0xffACDAE4),
        // slideWidth: MediaQuery.of(context).size.width*(),
        mainScreen: HomeScreen(drawerController),
        menuScreen: const MenuScreen(),
      ),
    );
  }
}
