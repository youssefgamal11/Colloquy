import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

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
          'Settings',
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
              hasScrollBody: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 50.0),
                            child: Container(
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadiusDirectional.only(
                                      topEnd: Radius.circular(30),
                                      topStart: Radius.circular(30)),
                                  color: Color(0xffF2F2FE),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: Column(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: const [
                                          SizedBox(
                                            height: 70,
                                          ),
                                          Text(
                                            'Youssef Gamal',
                                            style: TextStyle(
                                                color: Color(0xff1F4F5A),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 25),
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            '01023472880',
                                            style: TextStyle(
                                                color: Color(0xff1F4F5A)),
                                          )
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TextButton.icon(
                                            onPressed: () {},
                                            icon: const ImageIcon(
                                                AssetImage(
                                                    'assets/back_icon.png'),
                                                color: Color(0xff286977),
                                                size: 18),
                                            label: const Text(
                                              'Log Out',
                                              style: TextStyle(
                                                  color: Color(0xff286977),
                                                  fontSize: 18),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                )),
                          ),
                        ),
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: const [
                                CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 55,
                                ),
                                CircleAvatar(
                                  radius: 50,
                                  backgroundImage:
                                      AssetImage('assets/image.jpg'),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 8.0, top: 5),
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 15,
                                child: IconButton(
                                    onPressed: () {},
                                    icon: const ImageIcon(
                                      AssetImage('assets/video_icon.png'),
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ],
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
