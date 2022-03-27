import 'package:flutter/material.dart';

import '../../Helper/components.dart';
import '../../Helper/constant.dart';

class CallsScreen extends StatelessWidget {
  const CallsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      appBar: AppBar(
        backgroundColor: const Color(0xffFFFFFF),
        elevation: 0,
        leading: IconButton(
            onPressed: () {},
            icon: const ImageIcon(
              AssetImage('assets/back_icon.png'),
              size: 15,
              color: Color(0xff5DAABC),
            )),
        title: const Text(
          'Calls',
          style: TextStyle(
            color: Color(0xff337585),
            fontSize: 18,
          ),
        ),
        centerTitle: true,
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
                                Text(
                                  '  Recent Calls',
                                  style: TextStyle(
                                      color: Color(0xff337585),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20),
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
