import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controllers/Login-Contollers/autehntication.dart';
import '../Controllers/Login-Contollers/signinSignupController.dart';
import 'login-singup-screen/login_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Authentication authentication = Get.put(Authentication());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
              child: const Icon(color: Colors.pink, Icons.favorite_rounded),
              onPressed: () => {authentication.logOut()}),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: const Text(
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
