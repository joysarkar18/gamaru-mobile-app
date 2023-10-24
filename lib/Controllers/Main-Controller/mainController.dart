import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:gamaru_mobile_app/Screens/navigation_bar.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  static MainController get instance => Get.find();
  final _db = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance.currentUser;
  RxInt navBarIndex = 1.obs;
  RxBool is_loading = false.obs;

  RxBool exchangeLoading = false.obs;

  TextEditingController winCoins = TextEditingController();
  RxString palyCoins = "".obs;

  RxList allResults = [].obs;

  loadData() async {
    await FirebaseFirestore.instance
        .collection("loading")
        .doc("gamaru")
        .get()
        .then((value) {
      is_loading.value = value["is_loading"];
    });
  }

  void exchangeCoins(int amount) async {
    exchangeLoading.value = true;
    await _db
        .collection("user")
        .doc(user!.email.toString())
        .get()
        .then((value) async {
      int playCoins = value["coins"];
      int winCoins = value["winCoins"];

      if (amount > winCoins) {
        return;
      }

      winCoins = winCoins - amount;
      playCoins = playCoins + amount;
      await _db
          .collection("user")
          .doc(user!.email.toString())
          .update({"coins": playCoins, "winCoins": winCoins}).then((value) {
        exchangeLoading.value = false;
        Get.offAll(MainScreen());
      });
    });
  }

  loadAllResult() async {
    await FirebaseFirestore.instance
        .collection("result")
        .doc("allResult")
        .get()
        .then((value) {
      List temp = value["res"];
      List temp2 = [];

      for (int i = 0; i < temp.length; i++) {
        List nam = temp[i]["names"];
        List p = temp[i]["prize"];
        if (nam.length == 3 && p.length == 3) {
          temp2.add(temp[i]);
        }
      }
      allResults.value = temp2;
      print(allResults.value);
    });
  }
}
