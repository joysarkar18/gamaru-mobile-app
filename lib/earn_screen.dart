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
          child: TopDetails(),
        ));
  }
}
