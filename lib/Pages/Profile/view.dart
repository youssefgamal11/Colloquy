import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

import '../../Helper/components.dart';
import '../../Helper/constant.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

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
          'Profile',
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
                children: [
                  const SizedBox(
                    height: 30,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 100),
                                      const Text(
                                        'Full Name',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Color(0xff226370),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      customTextFormField(
                                        validate: () {},
                                        name: 'your name',
                                        button: IconButton(
                                          icon: const ImageIcon(
                                            AssetImage('assets/call_icon.png'),
                                            size: 15,
                                            color: Color(0xff226370),
                                          ),
                                          onPressed: () {},
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      const Text(
                                        'Phone',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Color(0xff226370),
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Row(
                                        children: [
                                          Container(
                                            height: 45,
                                            width: 50,
                                            decoration: BoxDecoration(
                                              color: textFormFieldColor,
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                            ),
                                            child: CountryCodePicker(
                                              showCountryOnly: false,
                                              showOnlyCountryWhenClosed: false,
                                              textStyle: const TextStyle(
                                                  color: textColor),
                                              enabled: true,
                                              favorite: const ['+20', 'EG'],
                                              hideMainText: false,
                                              showFlagMain: false,
                                              showFlag: true,
                                              hideSearch: false,
                                              showFlagDialog: true,
                                              padding: const EdgeInsets.all(0),
                                            ),
                                          ),
                                          const SizedBox(width: 20),
                                          Expanded(
                                            child: TextFormField(
                                              decoration: InputDecoration(
                                                  hintText: '01012355',
                                                  hintStyle: const TextStyle(
                                                    color: textColor,
                                                  ),
                                                  suffixIcon: IconButton(
                                                    icon: const ImageIcon(
                                                      AssetImage(
                                                          'assets/call_icon.png'),
                                                      size: 15,
                                                      color: Color(0xff226370),
                                                    ),
                                                    onPressed: () {},
                                                  ),
                                                  filled: true,
                                                  fillColor: textFormFieldColor,
                                                  contentPadding:
                                                      const EdgeInsets.only(
                                                          left: 20),
                                                  focusedBorder: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      borderSide: const BorderSide(
                                                          color:
                                                              textFormFieldColor)),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          borderSide:
                                                              const BorderSide(
                                                            color:
                                                                textFormFieldColor,
                                                          ))),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 15),
                                      const Text(
                                        'Password',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Color(0xff226370),
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      customTextFormField(
                                          validate: (s) {},
                                          name: 'Password',
                                          isShowen: true,
                                          button: TextButton(
                                            child: const Text(
                                              'change',
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Color(0xff559BAC),
                                              ),
                                            ),
                                            onPressed: () {},
                                          )),
                                      const SizedBox(height: 50),
                                      TextButton.icon(
                                        onPressed: () {},
                                        icon: const ImageIcon(
                                            AssetImage('assets/back_icon.png'),
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
                                  ),
                                )),
                          ),
                        ),
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            const CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage('assets/image.jpg'),
                            ),
                            CircleAvatar(
                              backgroundColor: const Color(0xffF2F2FE),
                              radius: 15,
                              child: IconButton(
                                  onPressed: () {},
                                  icon: const ImageIcon(
                                    AssetImage('assets/video_icon.png'),
                                  )),
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
