import 'package:chat_app/Pages/Home/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Helper/constant.dart';
import '../Calls/view.dart';
import '../Contacts/View.dart';
import '../Profile/view.dart';
import '../Settings/view.dart';
import '../favorites/view.dart';

class MyDrawerController extends GetxController {}

class DrawerScreen extends GetView<MyDrawerController> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: Drawer(
        backgroundColor: const Color(0xffF2F2FE),
        child: SizedBox(
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: InkWell(
                      onTap: () {},
                      child: const CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage('assets/image.jpg'),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text('Chats',
                        style: TextStyle(
                            color: textColor2,
                            fontSize: 32,
                            fontFamily: 'segoesc',
                            fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
              ListTile(
                title: const Text(
                  'Home',
                  style: TextStyle(fontSize: 18, color: Color(0xff559BAC)),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                },
              ),
              ListTile(
                title: const Text(
                  'Profile',
                  style: TextStyle(fontSize: 18, color: Color(0xff559BAC)),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProfileScreen()));
                },
              ),
              ListTile(
                title: const Text(
                  'Contacts',
                  style: TextStyle(fontSize: 18, color: Color(0xff559BAC)),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ContactsScreen()));
                },
              ),
              ListTile(
                title: const Text(
                  'Favorites',
                  style: TextStyle(fontSize: 18, color: Color(0xff559BAC)),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FavoritesScreen()));
                },
              ),
              ListTile(
                title: const Text(
                  'Calls',
                  style: TextStyle(fontSize: 18, color: Color(0xff559BAC)),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CallsScreen()));
                },
              ),
              ListTile(
                title: const Text(
                  'Settings',
                  style: TextStyle(fontSize: 18, color: Color(0xff559BAC)),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SettingsScreen()));
                },
              ),
              const SizedBox(height: 100),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton.icon(
                      onPressed: () {},
                      icon: const ImageIcon(
                        AssetImage('assets/logout_icon.png'),
                        size: 20,
                        color: Color(0xff5DAABC),
                      ),
                      label: const Text(
                        'Log Out',
                        style:
                            TextStyle(fontSize: 15, color: Color(0xff559BAC)),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
