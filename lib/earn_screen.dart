import 'package:flutter/material.dart';
import 'package:gamaru_mobile_app/Componants/glossyEffect.dart';
import 'package:gamaru_mobile_app/Controllers/Login-Contollers/autehntication.dart';
import 'package:gamaru_mobile_app/Screens/Top-section-every/top-part.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class EarnScreen extends StatelessWidget {
  const EarnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authentication = Get.put(Authentication());
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            children: [
              TopDetails(),
              Container(
                height: Get.height - 145,
                padding: EdgeInsets.only(top: 20),
                child: ListView(
                  children: [
                    GlossyCard(
                        height: 200.0,
                        width: Get.width * 0.95,
                        borderRadius: 10.0,
                        borderWith: 1.0,
                        child: Container()),
                    SizedBox(
                      height: 8,
                    ),
                    GlossyCard(
                        height: 200.0,
                        width: Get.width * 0.95,
                        borderRadius: 10.0,
                        borderWith: 1.0,
                        child: Container()),
                    SizedBox(
                      height: 8,
                    ),
                    GlossyCard(
                        height: 200.0,
                        width: Get.width * 0.95,
                        borderRadius: 10.0,
                        borderWith: 1.0,
                        child: Container()),
                    SizedBox(
                      height: 8,
                    ),
                    GlossyCard(
                        height: 200.0,
                        width: Get.width * 0.95,
                        borderRadius: 10.0,
                        borderWith: 1.0,
                        child: Container()),
                    SizedBox(
                      height: 8,
                    ),
                    GlossyCard(
                        height: 200.0,
                        width: Get.width * 0.95,
                        borderRadius: 10.0,
                        borderWith: 1.0,
                        child: Container()),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
