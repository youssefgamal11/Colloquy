import 'package:chat_app/Pages/Contacts/View.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Pages/Chat/view.dart';
import '../Pages/Profile/view.dart';
import 'constant.dart';

Widget customTextFormField({
  String? name,
  Widget? button,
  TextEditingController? controller,
  bool isShowen = false,
  TextInputType textInputType = TextInputType.text,
  required Function validate,
  // Function? onSaved
}) {
  return TextFormField(
    obscureText: isShowen,
    validator: (s) {
      validate(s);
      return;
    },
    // onSaved: (s) {
    //   onSaved!(s);
    // },
    keyboardType: textInputType,
    controller: controller,
    decoration: InputDecoration(
        errorStyle:
            const TextStyle(color: Colors.red, backgroundColor: Colors.black),
        hintText: name,
        hintStyle: const TextStyle(
          color: textColor,
        ),
        suffixIcon: button,
        filled: true,
        fillColor: textFormFieldColor,
        contentPadding: const EdgeInsets.only(left: 20),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.blue)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: textFormFieldColor,
            ))),
  );
}

Widget customTextFormFieldPhone({required String name}) {
  return Padding(
    padding: const EdgeInsets.only(left: 50, right: 50),
    child: TextFormField(
      decoration: InputDecoration(
          hintText: name,
          hintStyle: const TextStyle(
            color: textColor,
          ),
          filled: true,
          fillColor: textFormFieldColor,
          contentPadding: const EdgeInsets.only(left: 20),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: textFormFieldColor)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: textFormFieldColor,
              ))),
    ),
  );
}

Widget customChatTextField({
  required String s,
  required TextEditingController controller,
}) {
  return Align(
    alignment: Alignment.bottomCenter,
    child: Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8, bottom: 10),
      child: SizedBox(
        height: 50,
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
              hintText: s,
              hintStyle: const TextStyle(
                // ignore: use_full_hex_values_for_flutter_colors
                color: Color(0xff3C3C434D),
              ),
              filled: true,
              fillColor: textFormFieldColor,
              suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const ImageIcon(
                    AssetImage('assets/microphone.png'),
                    size: 20,
                    color: Color(0xff6AC6DB),
                  )),
              contentPadding: const EdgeInsets.only(left: 20),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: textFormFieldColor)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: textFormFieldColor,
                  ))),
        ),
      ),
    ),
  );
}

Widget chatItem(
    {required String name,
    required String friendName,
    required String friendUid}) {
  return Material(
    color: const Color(0xffF2F2FE),
    child: InkWell(
      onTap: () {
        Get.to(() => ChatScreen(friendName: friendName, friendUid: friendUid));
      },
      child: Padding(
          padding: const EdgeInsets.only(left: 25.0, right: 25),
          child: Column(
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage('assets/user.png'),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '0$name',
                          style: const TextStyle(
                              color: Color(0xff26515C),
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        const SizedBox(height: 5),
                        // const Text(
                        //   'hi youssef how are you',
                        //   style:
                        //       TextStyle(color: Color(0xffF87575), fontSize: 12),
                        // )
                      ]),
                  const Spacer(),
                  // Stack(
                  //   alignment: Alignment.center,
                  //   children: const [
                  //     CircleAvatar(
                  //       radius: 8,
                  //       backgroundColor: Color(0xffFF8D8D),
                  //     ),
                  //     Text(
                  //       '2',
                  //       style: TextStyle(
                  //           color: Color(0xff26515C),
                  //           fontSize: 10,
                  //           fontWeight: FontWeight.bold),
                  //     )
                  //   ],
                  // )
                ],
              ),
              const SizedBox(height: 5),
              Padding(
                padding:
                    const EdgeInsets.only(left: 35.0, right: 35, bottom: 5),
                child: Container(
                  height: 1,
                  width: double.infinity,
                  color: const Color(0xffB5B5CA),
                ),
              ),
            ],
          )),
    ),
  );
}

Widget favoriteItem({required String friendName, required String friendUid}) {
  return InkWell(
    onTap: () {
      Get.to(() => ChatScreen(
            friendName: friendName,
            friendUid: friendUid,
          ));
    },
    child: Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 25),
        child: Column(
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage('assets/image.jpg'),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'youssef gamal',
                        style: TextStyle(
                            color: Color(0xff26515C),
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'hi youssef how are you',
                        style:
                            TextStyle(color: Color(0xffF87575), fontSize: 12),
                      )
                    ]),
                const Spacer(),
                Stack(
                  alignment: Alignment.center,
                  children: const [
                    CircleAvatar(
                      radius: 8,
                      backgroundColor: Color(0xffFF8D8D),
                    ),
                    Text(
                      '2',
                      style: TextStyle(
                          color: Color(0xff26515C),
                          fontSize: 10,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(height: 15),
          ],
        )),
  );
}

Widget contactItem() {
  return Padding(
    padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 15),
    child: Row(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              image: const DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/image.jpg'),
              ),
              borderRadius: BorderRadius.circular(10)),
        ),
        const SizedBox(width: 10),
        const Text(
          'youssef gamal',
          style: TextStyle(
              color: Color(0xff337585),
              fontSize: 15,
              fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        IconButton(
            onPressed: () {
              Get.to(() => const ProfileScreen());
            },
            icon: const ImageIcon(
              AssetImage('assets/phone_image.png'),
              size: 20,
              color: Color(0xff5DAABC),
            )),
        IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            icon: const ImageIcon(
              AssetImage('assets/message_icon.png'),
              size: 20,
              color: Color(0xff5DAABC),
            ))
      ],
    ),
  );
}

void navigateAndFinish(context, widget) {
  Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => widget),
      (Route<dynamic> route) => false);
}

void navigateTo(context, widget) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}

Widget customLayout(Widget widget) {
  return CustomScrollView(
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
                  child: widget,
                ),
              ),
            )
          ],
        ),
      )
    ],
  );
}
