import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WalletController extends GetxController {
  static WalletController get instance => Get.find();
  RxBool myWalletStatus = false.obs;
  TextEditingController adMoneyController = TextEditingController();
  TextEditingController withdrawMoneyController = TextEditingController();
  RxString fee = "0".obs;
  RxString toAccount = "0".obs;
}
