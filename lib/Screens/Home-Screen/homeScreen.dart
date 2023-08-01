import 'package:another_carousel_pro/another_carousel_pro.dart';
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
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                height: 90,
                width: Get.width,
                child: AnotherCarousel(
                  images: [
                    AssetImage("Assets/ref_banner.png"),
                    AssetImage("Assets/customer_banner.png"),
                    // AssetImage("Assets/ref_banner.png"),
                  ],
                  showIndicator: false,
                  borderRadius: true,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 240,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("Assets/bgmi_home.png"),
                        fit: BoxFit.cover)),
              )
            ]),
          )
        ],
      )),
    );
  }
}
