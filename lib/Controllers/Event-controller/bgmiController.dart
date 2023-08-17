import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class BgmiController extends GetxController {
  static BgmiController get instance => Get.find();
  final _db = FirebaseFirestore.instance;
  List eventListBgmiUpcoming = [];
  RxBool upcoming_loading = true.obs;

  Future<void> joinBgmi(int index) async {
    await _db
        .collection("BATTLE GROUND MOBILE INDIA")
        .doc("upcoming")
        .get()
        .then((value) async {
      eventListBgmiUpcoming = value["events"];
      List temp = eventListBgmiUpcoming[index]["eventRegisteredPlayers"];
      temp.add(FirebaseAuth.instance.currentUser!.email.toString());
      eventListBgmiUpcoming[index]["eventRegisteredPlayers"] = temp;
      await _db
          .collection("BATTLE GROUND MOBILE INDIA")
          .doc("upcoming")
          .update({"event": eventListBgmiUpcoming});
    });
  }
}
