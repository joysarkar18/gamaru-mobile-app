import 'package:flutter/material.dart';
import 'package:gamaru_mobile_app/Controllers/Login-Contollers/autehntication.dart';
import 'package:get/get.dart';

class EarnScreen extends StatelessWidget {
  const EarnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authentication = Get.put(Authentication());
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Text("Earn Screen"),
          ElevatedButton(
              onPressed: () {
                authentication.logOut();
              },
              child: Text("Logout"))
        ],
      )),
    );
  }
}
