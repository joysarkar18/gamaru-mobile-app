import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_carousel_slider/flutter_custom_carousel_slider.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../Top-section-every/top-part.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CarouselItem> itemList = [
    CarouselItem(
      image: AssetImage("Assets/refer_cover_home.png"),
      boxDecoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset.bottomCenter,
          end: FractionalOffset.topCenter,
          colors: [
            Colors.blueAccent.withOpacity(1),
            Colors.black.withOpacity(.3),
          ],
          stops: const [0.0, 1.0],
        ),
      ),
      title:
          'Push your creativity to its limits by reimagining this classic puzzle!',
      titleTextStyle: const TextStyle(
        fontSize: 12,
        color: Colors.white,
      ),
      leftSubtitle: '\$51,046 in prizes',
      rightSubtitle: '4882 participants',
      rightSubtitleTextStyle: const TextStyle(
        fontSize: 12,
        color: Colors.black,
      ),
      onImageTap: (i) {},
    ),
    CarouselItem(
      image: AssetImage("Assets/service.jpeg"),
      title: '@coskuncay published flutter_custom_carousel_slider!',
      titleTextStyle: const TextStyle(
        fontSize: 12,
        color: Colors.white,
      ),
      leftSubtitle: '11 Feb 2022',
      rightSubtitle: 'v1.0.0',
      onImageTap: (i) {},
    ),
  ];
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
              child: ListView(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 5,
                    ),
                    height: 85,
                    width: Get.width,
                    child: CustomCarouselSlider(
                      items: itemList,
                      subHeight: 50,
                      width: MediaQuery.of(context).size.width * .9,
                      autoplay: true,
                      showText: false,
                      showSubBackground: false,
                      indicatorShape: BoxShape.rectangle,
                      selectedDotColor: Colors.white,
                      unselectedDotColor: Colors.white60,
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
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("Assets/FreeFire_home.png"),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 18,
                    ),
                    child: Container(
                      height: 220,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("Assets/ludo_home_screen.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 27,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 175,
                          width: Get.width - 40,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            image: DecorationImage(
                              image:
                                  AssetImage("Assets/carrom_home_screen.jpg"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
