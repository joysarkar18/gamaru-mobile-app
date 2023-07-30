import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Top-section-every/top-part.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Column(
        children: [
          TopDetails(),
          Container(
            height: Get.height - 145,
            padding: EdgeInsets.only(top: 20),
            child: ListView(children: [
              Container(
                height: 100,
                width: Get.width,
                child: AnotherCarousel(
                  images: [
                    AssetImage("Assets/telegram.png"),
                    AssetImage("Assets/aro boro baal.png"),
                    AssetImage("Assets/aro boro baal.png"),
                    AssetImage("Assets/aro boro baal.png"),
                    AssetImage("Assets/aro boro baal.png"),
                  ],
                  dotBgColor: Colors.transparent,
                ),
              )
            ]),
          )
        ],
      )),
    );
  }
}
