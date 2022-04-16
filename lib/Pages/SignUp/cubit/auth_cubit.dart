// ignore_for_file: avoid_print, unnecessary_this, unused_local_variable
import 'package:chat_app/Pages/SignUp/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  static AuthCubit get(context) => BlocProvider.of(context);
  late String verificationId;
  late String otpCode;
  late var countryCode = null;

  var phoneNumberController = TextEditingController();
  var nameController = TextEditingController();

  Future<void> phoneNumberAuth() async {
    emit(Loading());
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: countryCode.toString() + phoneNumberController.text,
      timeout: const Duration(seconds: 30),
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  }

  void verificationCompleted(PhoneAuthCredential credential) {
    print('verification completed');
    singIn(credential);
  }

  void verificationFailed(FirebaseAuthException error) {
    print('verification failed');
    emit(ErrorOccured(error: error.toString()));
  }

  void codeSent(String verificationId, int? forceResendingToken) {
    print('code sent');
    this.verificationId = verificationId;
    emit(PhoneNumberSubmitted());
  }

  void codeAutoRetrievalTimeout(String verificationId) {
    print('code retrival time');
  }

  Future<void> submitOTP() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: this.verificationId, smsCode: otpCode);
    await singIn(credential);
  }

  Future<void> singIn(PhoneAuthCredential credential) async {
    try {
      await FirebaseAuth.instance
          .signInWithCredential(credential)
          .then((value) {
        print(value.user!.uid);
      });
      emit(PhoneOTPVerified());
    } catch (e) {
      emit(ErrorOccured(error: e.toString()));
    }
  }

  User getLoggedinUser() {
    return FirebaseAuth.instance.currentUser!;
  }

  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
  }

//upload user data on firebase firestore
  void createUser({required String phone, required String uId}) {
    UserData model = UserData(
      uId: uId,
      phone: phone,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toMap())
        .then((value) {
      emit(UploadedOnFireStoreSucess());
    }).catchError((onError) {
      emit(UploadedOnFireStoreFailed(error: onError.toString()));
    });
  }

  // Future<DocumentSnapshot> getUserInfo() async {
  //   var firebaseUser = FirebaseAuth.instance.currentUser!;
  //   return await FirebaseFirestore.instance
  //       .collection("users")
  //       .doc(firebaseUser.uid)
  //       .get();
  // }

  // CollectionReference collectionRef =
  //     FirebaseFirestore.instance.collection('users');
  // Future<void> getData() async {
  //   // Get docs from collection reference
  //   QuerySnapshot querySnapshot = await collectionRef.get();
  //   print('function work');

  //   // Get data from docs and convert map to List
  //   final allData = querySnapshot.docs.map((doc) => doc.data()).toList();

  //   print(allData);
  // }
}
