import 'package:chat_app/Pages/Home/view.dart';
import 'package:chat_app/Pages/SignUp/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Pages/SignUp/view.dart';

late Widget widget;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Bloc.observer = SimpleBlocObserver();
  await Firebase.initializeApp();
  FirebaseAuth.instance.authStateChanges().listen((user) {
    if (user == null) {
      widget = SignUpScreen();
    } else {
      widget = const HomeScreen(null);
    }
  });
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AuthCubit(),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: widget,
      ),
    );
  }
}
