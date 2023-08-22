import 'package:flutter/material.dart';
import 'package:gamaru_mobile_app/Screens/Home-Screen/homeScreen.dart';
import 'package:gamaru_mobile_app/Screens/navigation_bar.dart';
import 'package:get/get.dart';

class WithdrawComplete extends StatelessWidget {
  const WithdrawComplete({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: InkWell(
        onTap: () {
          Get.offAll(MainScreen());
        },
        child: Text("back to Home"),
      )),
    );
  }
}
