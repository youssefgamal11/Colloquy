import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Helper/components.dart';
import '../../Helper/constant.dart';
import '../Drawer/view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

// ignore: must_be_immutable
class HomeScreen extends GetView<MyDrawerController> {
  // ignore: prefer_typing_uninitialized_variables
  // ignore: use_key_in_widget_constructors
  HomeScreen();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  var currentUser = FirebaseAuth.instance.currentUser!.uid;
  getUsers(AsyncSnapshot<QuerySnapshot> snapshot) {
    return snapshot.data?.docs
        .map((doc) => chatItem(
            name: doc['phone'],
            friendName: doc['phone'],
            friendUid: doc['uId']))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        backgroundColor: bacgroundColor,
        appBar: AppBar(
          backgroundColor: bacgroundColor,
          title: const Text('Colloquy',
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
        body: StreamBuilder<QuerySnapshot>(
          //this line to get all users expect current user
          stream: FirebaseFirestore.instance
              .collection('users')
              .where('uId', isNotEqualTo: currentUser)
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return customLayout(
                  const Center(child: Text('something went wrong ')));
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasData) {
              return customLayout(Center(
                child: ListView(
                  shrinkWrap: false,
                  physics: const BouncingScrollPhysics(),
                  children: getUsers(snapshot),
                ),
              ));
            }
            throw '';
          },
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
        drawer: const DrawerScreen());
  }
}
