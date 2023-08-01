import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

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
                  horizontal: 5,
                ),
                height: 85,
                width: Get.width,
                child: AnotherCarousel(
                  images: [
                    AssetImage("Assets/refer_cover_home.png"),
                    AssetImage("Assets/service.jpeg"),
                  ],
                  showIndicator: false,
                  onImageChange: (p0, p1) {
                    print("${p1}");
                  },
                  borderRadius: true,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    child: const Text(
                      " GAMES FOR YOU",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  LottieBuilder.asset(
                    "Assets/fire.json",
                    height: 30,
                    frameRate: FrameRate.max,
                  )
                ],
              ),
              Container(
                height: 220,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          "Assets/bgmi_home.png",
                        ),
                        fit: BoxFit.cover)),
              ),
              Container(
                height: 200,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("Assets/FreeFire_home.png"),
                )),
              )
            ]),
          )
        ],
      )),
    );
  }
}
