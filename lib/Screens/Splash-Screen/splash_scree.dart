import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../login-singup-screen/login_page.dart';
import '../login-singup-screen/signup_page.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => SplashState();
}

class SplashState extends State<Splash> {
  // ignore: non_constant_identifier_names
  static String KEYLOGIN = "login";

  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 300), () {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,

      // backgroundColor: Colors.blue,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromARGB(255, 82, 25, 103),
                // Color.fromARGB(78, 41, 36, 36),
                Color.fromARGB(140, 108, 50, 255),
                Color.fromARGB(232, 42, 42, 42),
              ]),
        ),
        child: Center(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("Assets/aro boro baal.png"),
                    ),
                  ),
                  height: Get.height * .85,
                  width: Get.width * 75,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void whereToGo() async {
    var sharedPref = await SharedPreferences.getInstance();

    var isLoggedIN = sharedPref.getBool(KEYLOGIN);

    Timer(const Duration(seconds: 3), () {
      if (isLoggedIN != null) {
        if (isLoggedIN) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const SignUp(),
            ),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const Login(),
            ),
          );
        }
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const Login(),
          ),
        );
      }
    });
  }
}
