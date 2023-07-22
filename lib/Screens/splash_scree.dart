import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:gamaru_mobile_app/Componants/glossyEffect.dart';
import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'login-singup-screen/login_page.dart';
import 'login-singup-screen/signup_page.dart';

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

    whereToGo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,

      // backgroundColor: Colors.blue,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(color: Color.fromARGB(255, 113, 111, 111)),
          child: Center(
            child: GlossyCard(
              borderWith: 0.0,
              height: Get.height * 0.85,
              width: Get.width * 0.89,
              borderRadius: 15.0,
              child: Center(
                child: Container(
                  color: Colors.transparent,
                  height: Get.height * .85,
                  width: Get.width * 75,
                  // decoration: BoxDecoration(color: Colors.white60
                  //     // gradient: LinearGradient(
                  //     //   begin: Alignment.bottomLeft,
                  //     //   end: Alignment.bottomRight,
                  //     //   colors: [Colors.blue, Colors.purple],
                  //     // ),
                  //     ),
                  child: SafeArea(
                    child: Center(
                      child: Image(
                        image: AssetImage(
                          "Assets/AI ENHANCED.png",
                        ),
                      ),
                    ),
                  ),
                ),
              ),
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
              builder: (context) => SignUp(),
            ),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Login(),
            ),
          );
        }
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Login(),
          ),
        );
      }
    });
  }
}
