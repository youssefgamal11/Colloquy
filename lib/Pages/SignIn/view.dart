// import 'package:chat_app/Pages/SignUp/cubit/auth_cubit.dart';
// import 'package:chat_app/Pages/SignUp/view.dart';
// import 'package:chat_app/Pages/verification/view.dart';
// import 'package:country_code_picker/country_code_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../Helper/components.dart';
// import '../../Helper/constant.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class LoginScreen extends StatelessWidget {
//   LoginScreen({Key? key}) : super(key: key);
//   final _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<AuthCubit, AuthState>(
//       listener: (context, state) {},
//       builder: (context, state) {
//         var cubit = AuthCubit.get(context);

//         return Scaffold(
//           body: SafeArea(
//             child: CustomScrollView(
//               slivers: [
//                 SliverFillRemaining(
//                   hasScrollBody: false,
//                   child: Form(
//                     key: _formKey,
//                     child: Column(
//                       children: [
//                         const SizedBox(height: 10),
//                         const Center(
//                             child: Text('Chats',
//                                 style: TextStyle(
//                                     color: textColor2,
//                                     fontSize: 35,
//                                     fontFamily: 'segoesc'))),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         Expanded(
//                           child: Container(
//                             width: double.infinity,
//                             decoration: const BoxDecoration(
//                               borderRadius: BorderRadiusDirectional.only(
//                                   topEnd: Radius.circular(30),
//                                   topStart: Radius.circular(30)),
//                               color: authBackGround,
//                             ),
//                             child: Stack(
//                               alignment: Alignment.center,
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.only(
//                                       left: 18.0, right: 18),
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.center,
//                                     children: [
//                                       const SizedBox(
//                                         height: 30,
//                                       ),
//                                       const Text(
//                                         'Log In',
//                                         style: TextStyle(
//                                             color: Colors.white, fontSize: 22),
//                                       ),
//                                       const SizedBox(
//                                         height: 85,
//                                       ),
//                                       // Row(
//                                       //   children: [
//                                       //     Container(
//                                       //       height: 45,
//                                       //       width: 87,
//                                       //       decoration: BoxDecoration(
//                                       //         color: textFormFieldColor,
//                                       //         borderRadius: BorderRadius.circular(6),
//                                       //       ),
//                                       //       child: CountryCodePicker(

//                                       //         showCountryOnly: false,
//                                       //         showOnlyCountryWhenClosed: false,
//                                       //         textStyle:
//                                       //             const TextStyle(color: textColor),
//                                       //         enabled: true,
//                                       //         favorite: const ['+20', 'EG'],
//                                       //         hideMainText: false,
//                                       //         showFlagMain: true,
//                                       //         showFlag: true,
//                                       //         hideSearch: false,
//                                       //         showFlagDialog: true,
//                                       //         padding: const EdgeInsets.all(0),
//                                       //       ),
//                                       //     ),
//                                       //     const SizedBox(width: 5),
//                                       //     // Expanded(
//                                       //     //   child: TextFormField(
//                                       //     //     decoration: InputDecoration(
//                                       //     //         hintText: 'phone',
//                                       //     //         hintStyle: const TextStyle(
//                                       //     //           color: textColor,
//                                       //     //         ),
//                                       //     //         filled: true,
//                                       //     //         fillColor: textFormFieldColor,
//                                       //     //         contentPadding:
//                                       //     //             const EdgeInsets.only(left: 20),
//                                       //     //         focusedBorder: OutlineInputBorder(
//                                       //     //             borderRadius:
//                                       //     //                 BorderRadius.circular(8),
//                                       //     //             borderSide: const BorderSide(
//                                       //     //                 color: textFormFieldColor)),
//                                       //     //         enabledBorder: OutlineInputBorder(
//                                       //     //             borderRadius:
//                                       //     //                 BorderRadius.circular(8),
//                                       //     //             borderSide: const BorderSide(
//                                       //     //               color: textFormFieldColor,
//                                       //     //             ))),
//                                       //     //   ),
//                                       //     // ),
//                                       //   ],
//                                       // ),
//                                       // const SizedBox(height: 20),
//                                       // customTextFormField(
//                                       //     name: 'Password', validate: (s) {}),

//                                       TextFormField(
//                                         obscureText: false,
//                                         validator: (value) {
//                                           if (value!.isEmpty) {
//                                             return 'please enter your phone ';
//                                           } else if (value.length < 11) {
//                                             return 'phone must not be less than 11 number';
//                                           }
//                                           // else if (FirebaseAuth.instance.) {
//                                           //   return null;
//                                           // }
//                                           return null;
//                                         },
//                                         keyboardType: TextInputType.number,
//                                         controller: cubit.phoneNumberController,
//                                         decoration: InputDecoration(
//                                             hintText: 'phone',
//                                             errorStyle: const TextStyle(
//                                               color: Colors.red,
//                                             ),
//                                             hintStyle: const TextStyle(
//                                               color: textColor,
//                                             ),
//                                             filled: true,
//                                             fillColor: textFormFieldColor,
//                                             contentPadding:
//                                                 const EdgeInsets.only(left: 20),
//                                             focusedErrorBorder:
//                                                 OutlineInputBorder(
//                                                     borderRadius:
//                                                         BorderRadius.circular(
//                                                             8),
//                                                     borderSide: const BorderSide(
//                                                         color: Colors.red)),
//                                             errorBorder: OutlineInputBorder(
//                                                 borderRadius:
//                                                     BorderRadius.circular(8),
//                                                 borderSide: const BorderSide(
//                                                     color: Colors.red)),
//                                             focusedBorder: OutlineInputBorder(
//                                                 borderRadius:
//                                                     BorderRadius.circular(8),
//                                                 borderSide: const BorderSide(
//                                                     color: Colors.blue)),
//                                             enabledBorder: OutlineInputBorder(
//                                                 borderRadius:
//                                                     BorderRadius.circular(8),
//                                                 borderSide: const BorderSide(
//                                                   color: textFormFieldColor,
//                                                 ))),
//                                       ),

//                                       const SizedBox(height: 60),

//                                       ConditionalBuilder(
//                                         builder: (context) => SizedBox(
//                                           width: 190,
//                                           height: 48,
//                                           child: TextButton(
//                                             onPressed: () {
//                                               if (_formKey.currentState!
//                                                   .validate()) {
//                                                 // ignore: avoid_print
//                                                 print('validate working');
//                                                 ScaffoldMessenger.of(context)
//                                                     .showSnackBar(
//                                                   const SnackBar(
//                                                       content: Text(
//                                                           'Processing Data')),
//                                                 );
//                                                 cubit.phoneNumberAuth();
//                                                 Get.to(
//                                                   () => verificationScreen(),
//                                                 );
//                                               }
//                                             },
//                                             child: const Text(
//                                               'Sign In',
//                                               style: TextStyle(
//                                                   color: authButtonText,
//                                                   fontSize: 16),
//                                             ),
//                                             style: TextButton.styleFrom(
//                                               elevation: 2,
//                                               primary: Colors.white,
//                                               backgroundColor: bacgroundColor,
//                                             ),
//                                           ),
//                                         ),
//                                         condition: state is! Loading,
//                                         fallback: (context) => const Center(
//                                             child: CircularProgressIndicator()),
//                                       ),
//                                       const SizedBox(height: 15),
//                                       Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.center,
//                                         children: [
//                                           const Text(
//                                             'Don\'t Have An Account ? ',
//                                             style: TextStyle(
//                                                 color: bacgroundColor),
//                                           ),
//                                           GestureDetector(
//                                             onTap: () {
//                                               Get.to(() => SignUpScreen());
//                                             },
//                                             child: const Text(
//                                               'Sign Up',
//                                               style: TextStyle(
//                                                   color: Color(0xff27282C),
//                                                   decoration:
//                                                       TextDecoration.underline),
//                                             ),
//                                           ),
//                                         ],
//                                       ),

//                                       GestureDetector(
//                                         onTap: () {
//                                           // cubit.getUserInfo();
//                                         },
//                                         child: const Text(
//                                           'print',
//                                           style: TextStyle(
//                                               color: Color(0xff27282C),
//                                               decoration:
//                                                   TextDecoration.underline),
//                                         ),
//                                       ),
//                                       const SizedBox(height: 15),
//                                     ],
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
