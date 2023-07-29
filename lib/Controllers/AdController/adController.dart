import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AdController extends GetxController {
  static AdController get instance => Get.find();
  RxBool ad_isLoading = false.obs;
  final _db = FirebaseFirestore.instance;
  var firebaseUser = FirebaseAuth.instance.currentUser;

  Future<void> updateWinCoins() async {
    int b = 0;
    await _db
        .collection("user")
        .doc(firebaseUser!.email.toString())
        .collection("watchCoinsWin")
        .doc("watchCoins")
        .get()
        .then((value) {
      b = value["coinsAd"];
      _db
          .collection("user")
          .doc(firebaseUser!.email.toString())
          .collection("watchCoinsWin")
          .doc("watchCoins")
          .update({"coinsAd": b + 1});
    });
  }
}
