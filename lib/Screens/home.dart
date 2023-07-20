import 'package:flutter/material.dart';
import 'package:gamaru_mobile_app/Screens/login_page.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
              child: Icon(color: Colors.pink, Icons.favorite_rounded),
              onPressed: () => {Get.to(Login())}),
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
