// ignore_for_file: avoid_print, unnecessary_this, unused_local_variable
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  static AuthCubit get(context) => BlocProvider.of(context);
  late String verificationId;
  late String otpCode;

  var phoneNumberController = TextEditingController();
  var nameController = TextEditingController();

  Future<void> phoneNumberAuth() async {
    emit(Loading());
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+2${phoneNumberController.text}',
        timeout: const Duration(seconds: 30),
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
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
      await FirebaseAuth.instance.signInWithCredential(credential);
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
}
