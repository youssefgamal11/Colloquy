import 'package:chat_app/Helper/components.dart';
import 'package:chat_app/Helper/constant.dart';
import 'package:chat_app/Helper/shared_pref.dart';
import 'package:chat_app/Pages/SignUp/view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({Key? key}) : super(key: key);
  // var onBoarding = CacheHelper.putBoolen(key: 'onBoarding', value: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bacgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 60,
              ),
              Text(
                'Let\'s connect with your friends',
                style: GoogleFonts.roboto(
                    color: textColor,
                    fontSize: 30,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 60,
              ),
              const Center(
                child: Image(
                  image: AssetImage('assets/onboarding.png'),
                  width: 320,
                  height: 320,
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              Center(
                child: SizedBox(
                  width: 300,
                  height: 50,
                  child: TextButton(
                    onPressed: () {
                      CacheHelper.saveData(key: 'onBoarding', value: true).then(
                          (value) =>
                              navigateAndFinish(context, SignUpScreen()));
                    },
                    child: const Text(
                      'Start Chatting',
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.normal),
                    ),
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      elevation: 2,
                      backgroundColor: const Color(0xff559BAC),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
