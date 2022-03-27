import 'package:chat_app/Helper/constant.dart';
import 'package:flutter/material.dart';
import '../../Helper/components.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: insideAppBackground,
      appBar: AppBar(
        backgroundColor: insideAppBackground,
        elevation: 0,
        leading: IconButton(
            onPressed: () {},
            icon: const ImageIcon(
              AssetImage('assets/back_icon.png'),
              size: 15,
              color: Color(0xff5DAABC),
            )),
        title: Row(
          children: const [
            Padding(
              padding: EdgeInsets.only(right: 5.0),
              child: CircleAvatar(
                radius: 18,
                backgroundImage: AssetImage('assets/image.jpg'),
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              'youssef gamal',
              style: TextStyle(
                  color: appTextColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        centerTitle: false,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const ImageIcon(
                AssetImage('assets/call_icon.png'),
                size: 20,
                color: Color(0xff5DAABC),
              )),
          IconButton(
              onPressed: () {},
              icon: const ImageIcon(
                AssetImage('assets/video_icon.png'),
                size: 20,
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
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadiusDirectional.only(
                            topEnd: Radius.circular(30),
                            topStart: Radius.circular(30)),
                        color: chatBackground,
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0, right: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const CircleAvatar(
                                              radius: 10,
                                              backgroundImage: AssetImage(
                                                  'assets/image.jpg'),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 22.0),
                                              child: Container(
                                                height: 45,
                                                child: const Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 8.0,
                                                      top: 15,
                                                      right: 10),
                                                  child: Text(
                                                      'Hey youssef how are you !'),
                                                ),
                                                decoration: const BoxDecoration(
                                                    color: Color(0xffF5F5F5),
                                                    borderRadius:
                                                        BorderRadiusDirectional
                                                            .only(
                                                                topEnd: Radius
                                                                    .circular(
                                                                        8),
                                                                bottomStart:
                                                                    Radius
                                                                        .circular(
                                                                            8),
                                                                bottomEnd: Radius
                                                                    .circular(
                                                                        8))),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Container(
                                        height: 45,
                                        child: const Padding(
                                          padding: EdgeInsets.only(
                                              left: 10.0, top: 15, right: 8),
                                          child: Text('all is good ahmed '),
                                        ),
                                        decoration: const BoxDecoration(
                                            color: Color(0xffF5F5F5),
                                            borderRadius:
                                                BorderRadiusDirectional.only(
                                                    topStart:
                                                        Radius.circular(8),
                                                    topEnd: Radius.circular(8),
                                                    bottomStart:
                                                        Radius.circular(8))),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const Spacer(),
                              customChatTextField('type message'),
                            ],
                          )
                        ],
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
