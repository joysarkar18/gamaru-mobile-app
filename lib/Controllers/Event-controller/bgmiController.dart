import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BgmiController extends GetxController {
  static BgmiController get instance => Get.find();
  final _db = FirebaseFirestore.instance;
  List eventListBgmiUpcoming = [];
  RxBool upcoming_loading = true.obs;
  TextEditingController bgmiIdController = TextEditingController();

  Future<void> joinBgmi(int index, DateTime dt, String bgmiId) async {
    await _db
        .collection("BATTLE GROUND MOBILE INDIA")
        .doc("upcoming")
        .get()
        .then((value) async {
      eventListBgmiUpcoming = value["event"];
      List temp = eventListBgmiUpcoming[index]["eventRegisteredPlayers"];
      temp.add(FirebaseAuth.instance.currentUser!.email.toString());
      eventListBgmiUpcoming[index]["eventRegisteredPlayers"] = temp;
      await _db
          .collection("BATTLE GROUND MOBILE INDIA")
          .doc("upcoming")
          .update({"event": eventListBgmiUpcoming});
    });

    await _db
        .collection("BGMI REGISTER LIST")
        .doc(dt.toString())
        .get()
        .then((value) {
      if (value.exists) {
        List l = value["players"];
        l.add(bgmiId);
        _db
            .collection("BGMI REGISTER LIST")
            .doc(dt.toString())
            .update({"players": l});
      } else {
        List l = [];
        l.add(bgmiId);
        _db
            .collection("BGMI REGISTER LIST")
            .doc(dt.toString())
            .set({"players": l});
      }
    });
  }

  getBgmiId() async {
    _db
        .collection("user")
        .doc(FirebaseAuth.instance.currentUser!.email.toString())
        .get()
        .then((value) {
      bgmiIdController.value = value["bgmiId"];
    });
  }

  updateBgmiId(String id) async {
    _db
        .collection("user")
        .doc(FirebaseAuth.instance.currentUser!.email.toString())
        .update({"bgmiId": id});
  }
}
