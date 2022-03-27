import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Helper/components.dart';
import '../../Helper/constant.dart';

class HomeScreen extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final zoomDrawerController;
  // ignore: use_key_in_widget_constructors
  const HomeScreen(this.zoomDrawerController);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              icon: const Icon(
                CupertinoIcons.search,
                color: buttonColor,
                size: 25,
              )),
        ],
        leading: IconButton(
          icon: const Icon(Icons.access_alarm),
          onPressed: () {},
        ),
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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
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
    );
  }
}
