
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Helper/components.dart';
import '../../Helper/constant.dart';
import '../Drawer/view.dart';

// ignore: must_be_immutable
class HomeScreen extends GetView<MyDrawerController> {
  // ignore: prefer_typing_uninitialized_variables
  // ignore: use_key_in_widget_constructors
  HomeScreen();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        backgroundColor: bacgroundColor,
        appBar: AppBar(
          backgroundColor: bacgroundColor,
          title: const Text('Chats',
              style: TextStyle(
                  color: textColor2,
                  fontSize: 32,
                  fontFamily: 'segoesc',
                  fontWeight: FontWeight.bold)),
          centerTitle: true,
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {},
                icon: const ImageIcon(
                  AssetImage('assets/search_ico.png'),
                  size: 20,
                  color: Color(0xff5DAABC),
                )),
          ],
          leading: IconButton(
              onPressed: () {
                scaffoldKey.currentState!.openDrawer();
              },
              icon: const ImageIcon(
                AssetImage('assets/drawer_icon.png'),
                size: 30,
                color: Color(0xff5DAABC),
              )),
        ),
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: true,
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadiusDirectional.only(
                              topEnd: Radius.circular(30),
                              topStart: Radius.circular(30)),
                          color: insideAppBackground,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 30.0),
                          child: ListView.builder(
                            shrinkWrap: false,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: ((context, index) => chatItem()),
                            itemCount: 20,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          backgroundColor: const Color(0xff559BAC),
          label: const Text(
            'New Chat',
            style: TextStyle(color: Colors.white, fontSize: 13),
          ),
          icon: const Icon(
            Icons.add,
            size: 17,
          ),
        ),
        drawer: DrawerScreen());
  }
}
