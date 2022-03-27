import 'package:chat_app/Pages/SignUp/view.dart';
import 'package:chat_app/Pages/verification/view.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Helper/components.dart';
import '../../Helper/constant.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  const Center(
                      child: Text('Chats',
                          style: TextStyle(
                              color: textColor2,
                              fontSize: 35,
                              fontFamily: 'segoesc'))),
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
                        color: authBackGround,
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 18.0, right: 18),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: 30,
                                ),
                                const Text(
                                  'Log In',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 22),
                                ),
                                const SizedBox(
                                  height: 85,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: 45,
                                      width: 87,
                                      decoration: BoxDecoration(
                                        color: textFormFieldColor,
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: CountryCodePicker(
                                        showCountryOnly: false,
                                        showOnlyCountryWhenClosed: false,
                                        textStyle:
                                            const TextStyle(color: textColor),
                                        enabled: true,
                                        favorite: const ['+20', 'EG'],
                                        hideMainText: false,
                                        showFlagMain: true,
                                        showFlag: true,
                                        hideSearch: false,
                                        showFlagDialog: true,
                                        padding: const EdgeInsets.all(0),
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    Expanded(
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                            hintText: 'phone',
                                            hintStyle: const TextStyle(
                                              color: textColor,
                                            ),
                                            filled: true,
                                            fillColor: textFormFieldColor,
                                            contentPadding:
                                                const EdgeInsets.only(left: 20),
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                borderSide: const BorderSide(
                                                    color: textFormFieldColor)),
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                borderSide: const BorderSide(
                                                  color: textFormFieldColor,
                                                ))),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                customTextFormField(
                                    name: 'Password', validate: (s) {}),
                                const SizedBox(height: 60),
                                SizedBox(
                                  width: 190,
                                  height: 48,
                                  child: TextButton(
                                    onPressed: () {
                                      Get.to((() => verificationScreen()));
                                    },
                                    child: const Text(
                                      'Sign In',
                                      style: TextStyle(
                                          color: authButtonText, fontSize: 16),
                                    ),
                                    style: TextButton.styleFrom(
                                      elevation: 2,
                                      primary: Colors.white,
                                      backgroundColor: bacgroundColor,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 15),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Don\'t Have An Account ? ',
                                      style: TextStyle(color: bacgroundColor),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Get.to(() => SignUpScreen());
                                      },
                                      child: const Text(
                                        'Sign Up',
                                        style: TextStyle(
                                            color: Color(0xff27282C),
                                            decoration:
                                                TextDecoration.underline),
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 15),
                              ],
                            ),
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
