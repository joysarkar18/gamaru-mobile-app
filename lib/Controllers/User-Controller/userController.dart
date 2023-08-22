// ignore: file_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();
  final _db = FirebaseFirestore.instance;
  var firebaseUser = FirebaseAuth.instance.currentUser;
  RxInt totalCoins = 0.obs;

  @override
  void onReady() {
    _db.collection("user").doc(firebaseUser!.email).get().then((value) {
      totalCoins.value = value["coins"];
    });
  }

  createUserDataUsingSignin(String id, String email) async {
    await _db.collection("user").doc(email).set({
      "id": id,
      "email": email,
      "coins": 0,
      "bgmiId": "",
      "winCoins": 0,
      "bankCards": [],
    }).then((_) {
      _db
          .collection("user")
          .doc(email)
          .collection("watchCoinsWin")
          .doc("watchCoins")
          .set({"coinsAd": 0});
    });
  }

  createUserDataUsingGoogleSignin(String id, String email) async {
    print("jsdkjbbajkdfasjksdaskjdaskjd  runninhg ndklahdsklakdhaskldsakld");

    var a = await _db.collection('user').doc(email).get();
    if (a.exists) {
      print("data already exists");
    } else {
      await _db.collection("user").doc(email).set({
        "id": id,
        "email": email,
        "coins": 0,
        "bgmiId": "",
        "winCoins": 0,
        "bankCards": [],
      }).then((_) {
        _db
            .collection("user")
            .doc(email)
            .collection("watchCoinsWin")
            .doc("watchCoins")
            .set({"coinsAd": 0});
      });
    }
  }
}
