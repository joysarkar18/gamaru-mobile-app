// ignore: file_names
import 'package:flutter/material.dart';
import 'package:gamaru_mobile_app/Screens/Home-Screen/home_shimmer.dart';
import 'package:get/get.dart';

import 'autehntication.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  //Testfield controllers to get data from textfield

  var nameController = TextEditingController();
  var phoneNumberController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController1 = TextEditingController();
  var passwordController2 = TextEditingController();
  var referalController = TextEditingController();
  String verificationId = "";
  var forgotPassemailController = TextEditingController();

  void registerUser(String email, String password, String referal) {
    Authentication.instance
        .createUserWithEmailPassword(email, password, referal)
        .then((value) {
      Get.offAll(const HomeShimmer());
    });
  }

  void loginUser(String email, String password) async {
    await Authentication.instance
        .loginUserWithEmailPassword(email, password)
        .then((value) {
      Get.offAll(const HomeShimmer());
    });
  }
}
