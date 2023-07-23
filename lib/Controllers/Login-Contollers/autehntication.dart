import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gamaru_mobile_app/Controllers/Login-Contollers/signinSignupController.dart';
import 'package:gamaru_mobile_app/Controllers/User-Controller/userController.dart';
import 'package:gamaru_mobile_app/Screens/home.dart';
import 'package:gamaru_mobile_app/Screens/login-singup-screen/login_page.dart';
import 'package:gamaru_mobile_app/Screens/login-singup-screen/otp_page.dart';
import 'package:gamaru_mobile_app/Screens/Splash-Screen/splash_scree.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:uuid/uuid.dart';

class Authentication extends GetxController {
  static Authentication get instance => Get.find();
  final _auth = FirebaseAuth.instance;
  late Rx<User?> firebaseUser;
  RxString? errorMsg = "".obs;
  RxString? errorMsgup = "".obs;
  // ignore: non_constant_identifier_names
  var is_loading = false.obs;
  final userController = Get.put(UserController());

  @override
  void onReady() {
    // Get called after widget is rendered on the screen
    super.onReady();
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitScreen);
  }

  _setInitScreen(User? user) {
    Timer(const Duration(seconds: 1), () {
      user == null
          ? Get.offAll(
              () => const Login()) //should change this to wellcome screen
          : Get.offAll(() => const HomeScreen());
    });
  }

  Future<void> createUserWithEmailPassword(
      String email, String password) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        await userController.createUserDataUsingSignin(Uuid().v1(), email);
        is_loading.value = false;
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        errorMsgup!.value = "Already have account! Login";
      } else if (e.code == "wrong-password") {
        errorMsgup!.value = "Wrong password";
      } else {
        errorMsgup!.value = "An error occourd";
      }
      is_loading.value = false;
    }
  }

  Future<void> loginUserWithEmailPassword(String email, String password) async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        is_loading.value = false;
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        errorMsg!.value = "user not exits! Sign Up";
      } else if (e.code == "wrong-password") {
        errorMsg!.value = "Wrong password";
      } else {
        errorMsg!.value = "An error occourd";
      }
      is_loading.value = false;
    }
  }

  googleSignIn() async {
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    _auth.signInWithCredential(credential).then((value) async {
      print("hiiiii ${value.user!.email}");
      await userController.createUserDataUsingGoogleSignin(
          Uuid().v1(), value.user!.email.toString().trim());
      is_loading.value = false;
    });
  }

  Future<void> logOut() async => await _auth.signOut().then((value) {
        is_loading.value = false;
      });
}
