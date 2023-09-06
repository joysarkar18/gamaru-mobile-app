// ignore: file_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gamaru_mobile_app/Controllers/ReferalController/referalController.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final referalController = Get.put(ReferalController());
  final _db = FirebaseFirestore.instance;
  var firebaseUser = FirebaseAuth.instance.currentUser;
  RxInt totalCoins = 0.obs;

  @override
  void onReady() {
    _db.collection("user").doc(firebaseUser!.email).get().then((value) {
      totalCoins.value = value["coins"];
    });
  }

  createUserDataUsingSignin(String id, String email, String referal) async {
    String refId = referalController.generateUniqueString(email);
    await _db
        .collection("user transactions")
        .doc(email)
        .set({"transactions": []});
    await _db.collection("user").doc(email).set({
      "id": id,
      "email": email,
      "coins": 0,
      "bgmiId": "",
      "winCoins": 0,
      "bankCards": [],
      "withdrawNo": "",
      "refId": refId,
      "rechargeFirst": true,
      "referal": referal,
      "allRef": [],
    }).then((_) {
      _db
          .collection("user")
          .doc(email)
          .collection("watchCoinsWin")
          .doc("watchCoins")
          .set({"coinsAd": 0});
      _db.collection("refId").doc(refId).set({"email": email}).then((_) {
        _db.collection("refId").doc(referal).get().then((value) {
          List allRefral = value["allRef"];
          allRefral.add(email);
          _db.collection("refId").doc(referal).update({"allRef": allRefral});
        });
      });
    });
  }

  createUserDataUsingGoogleSignin(
      String id, String email, String referal) async {
    print("jsdkjbbajkdfasjksdaskjdaskjd  runninhg ndklahdsklakdhaskldsakld");

    var a = await _db.collection('user').doc(email).get();
    if (a.exists) {
      print("data already exists");
    } else {
      String refId = referalController.generateUniqueString(email);
      await _db
          .collection("user transactions")
          .doc(email)
          .set({"transactions": []});
      await _db.collection("user").doc(email).set({
        "id": id,
        "email": email,
        "coins": 0,
        "bgmiId": "",
        "winCoins": 0,
        "bankCards": [],
        "rechargeNo": "",
        "refId": refId,
        "rechargeFirst": true,
        "refefral": referal,
        "allRef": []
      }).then((_) {
        _db
            .collection("user")
            .doc(email)
            .collection("watchCoinsWin")
            .doc("watchCoins")
            .set({"coinsAd": 0});
        _db
            .collection("refId")
            .doc(refId)
            .set({"email": email, "allRef": []}).then((_) {
          _db.collection("refId").doc(referal).get().then((value) {
            List allRefral = value["allRef"];
            allRefral.add(email);
            _db.collection("refId").doc(referal).update({"allRef": allRefral});
          });
        });
      });
    }
  }
}
