import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  static MainController get instance => Get.find();
  RxInt navBarIndex = 1.obs;
  RxBool is_loading = false.obs;

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
