import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gamaru_mobile_app/Screens/home.dart';
import 'package:gamaru_mobile_app/Screens/login-singup-screen/login_page.dart';
import 'package:gamaru_mobile_app/Screens/otp_page.dart';
import 'package:get/get.dart';

class Authentication extends GetxController {
  static Authentication get instance => Get.find();
  final _auth = FirebaseAuth.instance;
  late Rx<User?> firebaseUser;
  RxString? errorMsg = "".obs;
  RxString? errorMsgup = "".obs;

  @override
  void onReady() {
    // Get called after widget is rendered on the screen
    super.onReady();
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitScreen);
  }

  _setInitScreen(User? user) {
    Timer(const Duration(seconds: 4), () {
      user == null
          ? Get.offAll(() => Login()) //should change this to wellcome screen
          : Get.offAll(() => const HomeScreen());
    });
  }

  Future<void> createUserWithEmailPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        errorMsgup!.value = "Already have account! Sign In";
      } else if (e.code == "wrong-password") {
        errorMsgup!.value = "Wrong password";
      } else {
        errorMsgup!.value = "An error occourd";
      }
    }
  }

  Future<void> loginUserWithEmailPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        errorMsg!.value = "user not exits! Sign Up";
      } else if (e.code == "wrong-password") {
        errorMsg!.value = "Wrong password";
      } else {
        errorMsg!.value = "An error occourd";
      }
    }
  }

  Future<void> logOut() async => await _auth.signOut();
}
