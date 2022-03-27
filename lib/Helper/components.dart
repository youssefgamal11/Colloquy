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

Widget customChatTextField(String s) {
  return Align(
    alignment: Alignment.bottomCenter,
    child: Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8, bottom: 10),
            child: SizedBox(
              height: 50,
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: 'type a message ...',
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
                        borderSide:
                            const BorderSide(color: textFormFieldColor)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          color: textFormFieldColor,
                        ))),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 5.0, bottom: 8),
          child: Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
                color: const Color(0xff559BAC),
                borderRadius: BorderRadius.circular(50)),
            child: IconButton(
                onPressed: () {
                  Get.to(() => const ContactsScreen());
                },
                icon: const ImageIcon(
                  AssetImage('assets/send_icon.png'),
                  color: Colors.white,
                )),
          ),
        ),
      ],
    ),
  );
}

Widget chatItem() {
  return InkWell(
    onTap: () {
      Get.to(() => const ChatScreen());
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
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(left: 35.0, right: 35, bottom: 5),
              child: Container(
                height: 1,
                width: double.infinity,
                color: const Color(0xffB5B5CA),
              ),
            ),
          ],
        )),
  );
}

Widget favoriteItem() {
  return InkWell(
    onTap: () {
      Get.to(() => const ChatScreen());
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
