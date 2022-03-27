// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../../Helper/components.dart';
import '../../Helper/constant.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bacgroundColor,
      appBar: AppBar(
        backgroundColor: bacgroundColor,
        leading: IconButton(
            onPressed: () {},
            icon: const ImageIcon(
              AssetImage('assets/back_icon.png'),
              size: 15,
              color: Color(0xff5DAABC),
            )),
        title: const Text('Contacts',
            style: TextStyle(
                color: textColor2, fontSize: 20, fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const ImageIcon(
                AssetImage('assets/search_icon.png'),
                size: 17,
                color: Color(0xff5DAABC),
              )),
        ],
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: true,
              child: Column(
                children: [
                  const SizedBox(height: 5),
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
                        child: Column(children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, bottom: 25),
                            child: Row(
                              children: const [
                                Image(
                                    image:
                                        AssetImage('assets/phone_image.png')),
                                Text(
                                  '  All Contacts',
                                  style: TextStyle(
                                      color: Color(0xff337585),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                              shrinkWrap: false,
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: ((context, index) => contactItem()),
                              itemCount: 20,
                            ),
                          ),
                        ]),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
