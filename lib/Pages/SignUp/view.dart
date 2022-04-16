import 'package:chat_app/Helper/constant.dart';
import 'package:chat_app/Pages/SignIn/view.dart';
import 'package:chat_app/Pages/SignUp/cubit/auth_cubit.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Verification/view.dart';
import 'cubit/auth_cubit.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

// ignore: must_be_immutable
class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  TextEditingController controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AuthCubit.get(context);

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
                      Form(
                        key: _formKey,
                        child: Expanded(
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
                                  padding: const EdgeInsets.only(
                                      left: 18.0, right: 18),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      const Text(
                                        'Welcome',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 22),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      // Stack(
                                      //   alignment: Alignment.bottomRight,
                                      //   children: [
                                      //     const Padding(
                                      //       padding: EdgeInsets.all(8.0),
                                      //       child: CircleAvatar(
                                      //         radius: 45,
                                      //         backgroundImage: AssetImage(
                                      //             'assets/profile.png'),
                                      //       ),
                                      //     ),
                                      //     IconButton(
                                      //         color: const Color(0xffD7ECFE),
                                      //         onPressed: () {},
                                      //         icon: const Icon(CupertinoIcons
                                      //             .add_circled_solid))
                                      //   ],
                                      // ),

                                      // const SizedBox(height: 25),

                                      // TextFormField(
                                      //   obscureText: false,
                                      //   validator: (value) {
                                      //     if (value!.isEmpty) {
                                      //       return 'please enter your name ';
                                      //     }
                                      //     return null;
                                      //   },
                                      //   keyboardType: TextInputType.text,
                                      //   controller: cubit.nameController,
                                      //   decoration: InputDecoration(
                                      //       hintText: 'name',
                                      //       errorStyle: const TextStyle(
                                      //         color: Colors.red,
                                      //       ),
                                      //       hintStyle: const TextStyle(
                                      //         color: textColor,
                                      //       ),
                                      //       filled: true,
                                      //       fillColor: textFormFieldColor,
                                      //       contentPadding:
                                      //           const EdgeInsets.only(left: 20),
                                      //       focusedErrorBorder:
                                      //           OutlineInputBorder(
                                      //               borderRadius:
                                      //                   BorderRadius.circular(
                                      //                       8),
                                      //               borderSide: const BorderSide(
                                      //                   color: Colors.red)),
                                      //       errorBorder: OutlineInputBorder(
                                      //           borderRadius:
                                      //               BorderRadius.circular(8),
                                      //           borderSide: const BorderSide(
                                      //               color: Colors.red)),
                                      //       focusedBorder: OutlineInputBorder(
                                      //           borderRadius:
                                      //               BorderRadius.circular(8),
                                      //           borderSide: const BorderSide(
                                      //               color: Colors.blue)),
                                      //       enabledBorder: OutlineInputBorder(
                                      //           borderRadius:
                                      //               BorderRadius.circular(8),
                                      //           borderSide: const BorderSide(
                                      //             color: textFormFieldColor,
                                      //           ))),
                                      // ),

                                      const SizedBox(height: 20),

                                      const SizedBox(height: 80),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 20.0),
                                            child: Container(
                                              height: 46,
                                              width: 78,
                                              decoration: BoxDecoration(
                                                color: textFormFieldColor,
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                              ),
                                              child: CountryCodePicker(
                                                onChanged: (value) {
                                                  cubit.countryCode = value;
                                                },
                                                showCountryOnly: false,
                                                showOnlyCountryWhenClosed:
                                                    false,
                                                textStyle: const TextStyle(
                                                    color: textColor),
                                                enabled: true,
                                                favorite: const ['+20', 'EG'],
                                                hideMainText: false,
                                                showFlagMain: true,
                                                showFlag: true,
                                                hideSearch: false,
                                                showFlagDialog: true,
                                                padding:
                                                    const EdgeInsets.all(0),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 5),
                                          Expanded(
                                            child: TextFormField(
                                              obscureText: false,
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return 'please enter your phone ';
                                                } else if (value.length < 10) {
                                                  return 'phone must not be less than 10 number';
                                                }
                                                return null;
                                              },
                                              keyboardType:
                                                  TextInputType.number,
                                              controller:
                                                  cubit.phoneNumberController,
                                              decoration: InputDecoration(
                                                  helperText: '',
                                                  hintText: 'phone',
                                                  errorStyle: const TextStyle(
                                                    color: Colors.red,
                                                  ),
                                                  hintStyle: const TextStyle(
                                                    color: textColor,
                                                  ),
                                                  filled: true,
                                                  fillColor: textFormFieldColor,
                                                  contentPadding:
                                                      const EdgeInsets.only(
                                                          left: 20),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  8),
                                                          borderSide:
                                                              const BorderSide(
                                                                  color: Colors
                                                                      .red)),
                                                  errorBorder: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      borderSide: const BorderSide(
                                                          color: Colors.red)),
                                                  focusedBorder: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      borderSide: const BorderSide(
                                                          color: Colors.blue)),
                                                  enabledBorder: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(8),
                                                      borderSide: const BorderSide(
                                                        color:
                                                            textFormFieldColor,
                                                      ))),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 40),
                                      ConditionalBuilder(
                                        builder: (context) => SizedBox(
                                          width: 190,
                                          height: 48,
                                          child: TextButton(
                                            onPressed: () {
                                              if (cubit.countryCode == null) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                        const SnackBar(
                                                  content: Text(
                                                      'please enter your country code '),
                                                ));
                                              }
                                              if (_formKey.currentState!
                                                  .validate()) {
                                                // ignore: avoid_print
                                                print('validate working');
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  const SnackBar(
                                                      content: Text(
                                                          'Processing Data')),
                                                );
                                                cubit.phoneNumberAuth();
                                                Get.to(
                                                  () => verificationScreen(),
                                                );
                                              }
                                            },
                                            child: const Text(
                                              'Countinue',
                                              style: TextStyle(
                                                  color: authButtonText,
                                                  fontSize: 16),
                                            ),
                                            style: TextButton.styleFrom(
                                              elevation: 2,
                                              primary: Colors.white,
                                              backgroundColor: bacgroundColor,
                                            ),
                                          ),
                                        ),
                                        condition: true,
                                        fallback: (context) => const Center(
                                            child: CircularProgressIndicator()),
                                      ),
                                      const SizedBox(height: 15),
                                      // Row(
                                      //   mainAxisAlignment:
                                      //       MainAxisAlignment.center,
                                      //   children: [
                                      //     const Text(
                                      //       'Already have account? ',
                                      //       style: TextStyle(
                                      //           color: bacgroundColor),
                                      //     ),
                                      //     GestureDetector(
                                      //       onTap: () {
                                      //         Get.to(() => LoginScreen());
                                      //       },
                                      //       child: const Text(
                                      //         'LOG IN',
                                      //         style: TextStyle(
                                      //             color: Color(0xff27282C),
                                      //             decoration:
                                      //                 TextDecoration.underline),
                                      //       ),
                                      //     )
                                      //   ],
                                      // ),
                                    ],
                                  ),
                                )
                              ],
                            ),
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
