import 'package:flutter/material.dart';
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

  void registerUser(String email, String password) {
    Authentication.instance.createUserWithEmailPassword(email, password);
  }

  void loginUser(String email, String password) {
    Authentication.instance.loginUserWithEmailPassword(email, password);
  }
}
