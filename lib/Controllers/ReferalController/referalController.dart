// ignore: file_names
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ReferalController extends GetxController {
  static ReferalController get instance => Get.find();

  RxString refId = "".obs;
  RxInt refAmount = 0.obs;

  String generateUniqueString(String input) {
    // Calculate a hash of the input string using SHA-256
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);

    // Take the first 5 characters of the hexadecimal digest
    final hash = digest.toString().substring(0, 5);

    return hash;
  }

  getIdAmount() async {
    await FirebaseFirestore.instance
        .collection("user")
        .doc(FirebaseAuth.instance.currentUser!.email.toString())
        .get()
        .then((value) async {
      refId.value = value["refId"];
      print("ansssssssssssssssssssssssssssssssssssssssssssssssssssssss" +
          refId.value);
      await FirebaseFirestore.instance
          .collection("ReferalAmount")
          .doc("refAmount")
          .get()
          .then((value) {
        refAmount.value = value["amount"];
      });
    });
  }
}
