import 'package:chat_app/Helper/constant.dart';
import 'package:chat_app/Pages/Home/view.dart';
import 'package:flutter/material.dart';
import '../../Helper/components.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen(
      {Key? key, required this.friendName, required this.friendUid})
      : super(key: key);
  final String friendName;
  final String friendUid;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  CollectionReference chats = FirebaseFirestore.instance.collection('chats');
  final currenUserUid = FirebaseAuth.instance.currentUser!.uid;
  var chatDocId;
  var textController = new TextEditingController();
  @override
  void initState() {
    super.initState();
    checkUser();
  }

  void checkUser() async {
    await chats
        .where('users',
            isEqualTo: {widget.friendUid: null, currenUserUid: null})
        .limit(1)
        .get()
        .then(
          (QuerySnapshot querySnapshot) async {
            if (querySnapshot.docs.isNotEmpty) {
              setState(() {
                chatDocId = querySnapshot.docs.single.id;
              });

              print(chatDocId);
            } else {
              await chats.add({
                'users': {currenUserUid: null, widget.friendUid: null}
              }).then((value) => {chatDocId = value});
            }
          },
        )
        .catchError((error) {});
  }

  void sendMessage({required String msg}) {
    if (msg == '') return;
    chats.doc(chatDocId).collection('messages').add({
      'createdOn': FieldValue.serverTimestamp(),
      'uid': currenUserUid,
      'msg': msg
    }).then((value) {
      textController.text = '';
    });
  }

  bool isSender(String friend) {
    return friend == currenUserUid;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: insideAppBackground,
      appBar: AppBar(
        backgroundColor: insideAppBackground,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              navigateAndFinish(context, HomeScreen());
            },
            icon: const ImageIcon(
              AssetImage('assets/back_icon.png'),
              size: 15,
              color: Color(0xff5DAABC),
            )),
        title: Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 5.0),
              child: CircleAvatar(
                radius: 18,
                backgroundImage: AssetImage('assets/user.png'),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              '0${widget.friendName}',
              style: const TextStyle(
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
                      child: StreamBuilder<QuerySnapshot>(
                        stream: chats
                            .doc(chatDocId)
                            .collection('messages')
                            .orderBy('createdOn', descending: true)
                            .snapshots(),
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasError) {
                            return customLayout(const Center(
                                child: Text('something went wrong ')));
                          }
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                          if (snapshot.hasData) {
                            var data;
                            return Column(
                              children: [
                                Expanded(
                                  child: ListView(
                                    reverse: true,
                                    children: snapshot.data!.docs.map(
                                      (DocumentSnapshot document) {
                                        data = document.data()!;
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10.0,
                                                            right: 10),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        isSender(data['uid']
                                                                .toString())
                                                            ? Align(
                                                                alignment: Alignment
                                                                    .centerRight,
                                                                child:
                                                                    Container(
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            12.0),
                                                                    child:
                                                                        Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .end,
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .min,
                                                                      children: [
                                                                        Padding(
                                                                          padding: const EdgeInsets.only(
                                                                              right: 70,
                                                                              bottom: 12,
                                                                              top: 12),
                                                                          child:
                                                                              Text(data['msg']),
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsets.only(
                                                                              right: 5,
                                                                              bottom: 5),
                                                                          child:
                                                                              Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.end,
                                                                            mainAxisSize:
                                                                                MainAxisSize.min,
                                                                            children: [
                                                                              Text(
                                                                                data['createdOn'] == null ? DateTime.now().toString() : data['createdOn'].toDate().toString(),
                                                                                style: const TextStyle(color: Color(0xff448292), fontSize: 7),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  decoration: const BoxDecoration(
                                                                      color: Color(
                                                                          0xffF5F5F5),
                                                                      borderRadius: BorderRadiusDirectional.only(
                                                                          topStart: Radius.circular(
                                                                              8),
                                                                          topEnd: Radius.circular(
                                                                              15),
                                                                          bottomStart:
                                                                              Radius.circular(8))),
                                                                ),
                                                              )
                                                            : Row(
                                                                children: [
                                                                  Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      const CircleAvatar(
                                                                        radius:
                                                                            10,
                                                                        backgroundImage:
                                                                            AssetImage('assets/image.jpg'),
                                                                      ),
                                                                      Padding(
                                                                        padding:
                                                                            const EdgeInsets.only(left: 22.0),
                                                                        child:
                                                                            Container(
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                const EdgeInsets.only(left: 12.0),
                                                                            child:
                                                                                Column(
                                                                              crossAxisAlignment: CrossAxisAlignment.end,
                                                                              mainAxisSize: MainAxisSize.min,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: const EdgeInsets.only(right: 70, bottom: 12, top: 12),
                                                                                  child: Text(data['msg']),
                                                                                ),
                                                                                Padding(
                                                                                  padding: const EdgeInsets.only(right: 5, bottom: 5),
                                                                                  child: Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                                                    mainAxisSize: MainAxisSize.min,
                                                                                    children: [
                                                                                      Text(
                                                                                        data['createdOn'] == null ? DateTime.now().toString() : data['createdOn'].toDate().toString(),
                                                                                        style: const TextStyle(color: Color(0xff448292), fontSize: 7),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                )
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          decoration: const BoxDecoration(
                                                                              color: Color(0xffF5F5F5),
                                                                              borderRadius: BorderRadiusDirectional.only(topStart: Radius.circular(8), topEnd: Radius.circular(15), bottomEnd: Radius.circular(8))),
                                                                        ),
                                                                      )
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        );
                                      },
                                    ).toList(),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: customChatTextField(
                                        s: 'type a message ...',
                                        controller: textController,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 5.0, bottom: 8),
                                      child: Container(
                                        height: 45,
                                        width: 45,
                                        decoration: BoxDecoration(
                                            color: const Color(0xff559BAC),
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                        child: IconButton(
                                            onPressed: () {
                                              sendMessage(
                                                  msg: textController.text);
                                            },
                                            icon: const ImageIcon(
                                              AssetImage(
                                                  'assets/send_icon.png'),
                                              color: Colors.white,
                                            )),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            );
                          } else {
                            return Container();
                          }
                        },
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

//  Stack(
//                         alignment: Alignment.center,
//                         children: [
//                           Column(
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.only(
//                                     left: 10.0, right: 10),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.center,
//                                   children: [
//                                     const SizedBox(
//                                       height: 30,
//                                     ),
//                                     Row(
//                                       children: [
//                                         Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             const CircleAvatar(
//                                               radius: 10,
//                                               backgroundImage: AssetImage(
//                                                   'assets/image.jpg'),
//                                             ),
//                                             Padding(
//                                               padding: const EdgeInsets.only(
//                                                   left: 22.0),
//                                               child: Container(
//                                                 height: 45,
//                                                 child: const Padding(
//                                                   padding: EdgeInsets.only(
//                                                       left: 8.0,
//                                                       top: 15,
//                                                       right: 10),
//                                                   child: Text(
//                                                       'Hey youssef how are you !'),
//                                                 ),
//                                                 decoration: const BoxDecoration(
//                                                     color: Color(0xffF5F5F5),
//                                                     borderRadius:
//                                                         BorderRadiusDirectional
//                                                             .only(
//                                                                 topEnd: Radius
//                                                                     .circular(
//                                                                         8),
//                                                                 bottomStart:
//                                                                     Radius
//                                                                         .circular(
//                                                                             8),
//                                                                 bottomEnd: Radius
//                                                                     .circular(
//                                                                         8))),
//                                               ),
//                                             )
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//                                     const SizedBox(height: 10),
//                                     Align(
//                                       alignment: Alignment.centerRight,
//                                       child: Container(
//                                         height: 45,
//                                         child: const Padding(
//                                           padding: EdgeInsets.only(
//                                               left: 10.0, top: 15, right: 8),
//                                           child: Text('all is good ahmed '),
//                                         ),
//                                         decoration: const BoxDecoration(
//                                             color: Color(0xffF5F5F5),
//                                             borderRadius:
//                                                 BorderRadiusDirectional.only(
//                                                     topStart:
//                                                         Radius.circular(8),
//                                                     topEnd: Radius.circular(8),
//                                                     bottomStart:
//                                                         Radius.circular(8))),
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                               const Spacer(),
//                               customChatTextField('type message'),
//                             ],
//                           )
//                         ],
//                       ),
