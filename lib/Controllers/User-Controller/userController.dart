// ignore: file_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();
  final _db = FirebaseFirestore.instance;
  var firebaseUser = FirebaseAuth.instance.currentUser;

  createUserDataUsingSignin(String id, String email) async {
    await _db.collection("user").doc(email).set({"id": id, "email": email});
  }

  createUserDataUsingGoogleSignin(String id, String email) async {
    print("jsdkjbbajkdfasjksdaskjdaskjd  runninhg ndklahdsklakdhaskldsakld");

    var a = await _db.collection('user').doc(email).get();
    if (a.exists) {
      print("data already exists");
    } else {
      await _db.collection("user").doc(email).set({"id": id, "email": email});
    }
  }
}
