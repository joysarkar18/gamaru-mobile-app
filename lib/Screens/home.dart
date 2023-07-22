import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controllers/Login-Contollers/autehntication.dart';
import '../Controllers/Login-Contollers/signinSignupController.dart';
import 'login-singup-screen/login_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final signupController = Get.put(SignupController());
    final Authentication authentication = Get.put(Authentication());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
              child: Icon(color: Colors.pink, Icons.favorite_rounded),
              onPressed: () => {authentication.logOut()}),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                  style: TextStyle(
                      fontSize: 18,
                      fontStyle: FontStyle.normal,
                      color: Colors.red),
                  "PINK iS RARE"))
        ],
      )),
    );
  }
}
