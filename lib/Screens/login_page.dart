import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:gamaru_mobile_app/Componants/glossyEffect.dart';
import 'package:gamaru_mobile_app/Screens/signup_page.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("Assets/BgLogin1.png"), fit: BoxFit.cover)),
        child: Center(
          child: GlossyCard(
              height: Get.height * 0.85,
              width: Get.width * 0.89,
              borderRadius: 15.0,
              child: Container(
                child: Text("Here the TextFill will added",
                    style: TextStyle(color: Colors.white, fontSize: 20)),
              )),
        ),
      ),
    );
  }
}
