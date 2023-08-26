import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  static MainController get instance => Get.find();
  RxInt navBarIndex = 1.obs;
  RxBool is_loading = true.obs;

  loadData() async {
    await FirebaseFirestore.instance
        .collection("loading")
        .doc("gamaru")
        .get()
        .then((value) {
      Timer(const Duration(microseconds: 500), () {
        is_loading.value = value["is_loading"];
      });
    });
  }
}
