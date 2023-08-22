import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gamaru_mobile_app/Screens/Wallet-Screens/withdrawl.dart';
import 'package:get/get.dart';

class WalletController extends GetxController {
  static WalletController get instance => Get.find();
  final _db = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance.currentUser;
  RxBool myWalletStatus = false.obs;
  TextEditingController adMoneyController = TextEditingController();
  TextEditingController withdrawMoneyController = TextEditingController();
  RxString fee = "0".obs;
  RxString toAccount = "0".obs;
  TextEditingController accountNoController = TextEditingController();
  TextEditingController bankNameController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController ifscCodeController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  addBankCard(
      accountNoorUPI, bankName, name, phoneNo, ifscCode, address) async {
    await _db
        .collection("user")
        .doc(user!.email.toString())
        .get()
        .then((value) async {
      List l = value["bankCards"];
      l.add({
        "accNoorUpi": accountNoorUPI,
        "bankName": bankName,
        "name": name,
        "phoneNO": phoneNo,
        "ifscCode": ifscCode,
        "address": address
      });
      await _db
          .collection("user")
          .doc(user!.email.toString())
          .update({"bankCards": l}).then((value) {
        Get.off(WithdrawScreen());
      });
    });
  }
}
