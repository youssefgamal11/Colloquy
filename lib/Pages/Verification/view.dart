import 'package:chat_app/Pages/Chat/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../Helper/constant.dart';
import '../Home/view.dart';
import '../SignIn/view.dart';
import '../SignUp/cubit/auth_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: camel_case_types
class verificationScreen extends StatelessWidget {
  verificationScreen({Key? key}) : super(key: key);
  final scafoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is PhoneOTPVerified) {
          Navigator.pop(context);
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HomeScreen(null)));
          // Get.to((context) => const ChatScreen());
        }
        if (state is ErrorOccured) {
          String errorMsg = (state).error;
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(errorMsg),
            // duration: const Duration(seconds: 15),
          ));
        }
      },
      builder: (context, state) {
        var cubit = AuthCubit.get(context);
        String phone = AuthCubit.get(context).phoneNumberController.text;
        return Scaffold(
          key: scafoldKey,
          backgroundColor: bacgroundColor,
          appBar: AppBar(
            title: const Text(
              'Verify Your Phone',
              style: TextStyle(
                  color: authButtonText,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            elevation: 0,
            backgroundColor: bacgroundColor,
            leading: IconButton(
                onPressed: () {
                  Get.to(() => const LoginScreen());
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: authButtonText,
                  size: 17,
                )),
          ),
          body: SafeArea(
            child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    children: [
                      const SizedBox(height: 15),
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
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    height: 80,
                                  ),
                                  const Image(
                                      image: AssetImage(
                                          'assets/verificationImage.png')),
                                  const SizedBox(height: 15),
                                  const Text(
                                    'Enter Verification Code',
                                    style: TextStyle(
                                        color: Color(0xff234851), fontSize: 20),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    'Please enter verification code you \'ve received on',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    phone,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  const SizedBox(height: 30),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0, right: 8, bottom: 15),
                                    child: PinCodeTextField(
                                      appContext: context,
                                      length: 6,
                                      obscureText: false,
                                      enableActiveFill: true,
                                      animationType: AnimationType.scale,
                                      onCompleted: (code) {
                                        cubit.otpCode = code;
                                        // ignore: avoid_print
                                        print('complete');
                                      },
                                      pinTheme: PinTheme(
                                          fieldWidth: 45,
                                          fieldHeight: 55,
                                          shape: PinCodeFieldShape.box,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          errorBorderColor: Colors.red,
                                          activeFillColor: Colors.white,
                                          inactiveFillColor: Colors.white,
                                          selectedFillColor: Colors.white,
                                          inactiveColor: Colors.white),
                                      onChanged: (String value) {},
                                    ),
                                  ),
                                  SizedBox(
                                    width: 190,
                                    height: 48,
                                    child: TextButton(
                                      onPressed: () {
                                        cubit.submitOTP();
                                      },
                                      child: const Text(
                                        'Confirm',
                                        style: TextStyle(
                                            color: textColor, fontSize: 16),
                                      ),
                                      style: TextButton.styleFrom(
                                        elevation: 2,
                                        primary: Colors.white,
                                        backgroundColor: bacgroundColor,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 15),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Icon(
                                          Icons.refresh_rounded,
                                          color: Colors.white,
                                          size: 15,
                                        ),
                                        Text(
                                          '  Resend Code ',
                                          style:
                                              TextStyle(color: bacgroundColor),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 15),
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
      },
    );
  }
}
