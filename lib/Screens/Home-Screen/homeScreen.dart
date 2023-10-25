import 'package:flutter/material.dart';
import 'package:flutter_custom_carousel_slider/flutter_custom_carousel_slider.dart';
import 'package:gamaru_mobile_app/Componants/glossyEffect.dart';
import 'package:gamaru_mobile_app/Controllers/Main-Controller/mainController.dart';
import 'package:gamaru_mobile_app/Screens/Home-Screen/home_shimmer.dart';
import 'package:gamaru_mobile_app/Screens/refer_screen/refer_earn_screen.dart';
import 'package:gamaru_mobile_app/game_screen.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Customer Support/SupportScreen.dart';
import '../Top-section-every/top-part.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MainController mainController = Get.put(MainController());
  List<CarouselItem> itemList = [
    CarouselItem(
      image: const AssetImage("Assets/ref_banner.jpg"),
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
      onImageTap: (i) {
        Get.to(ReferAndEarn());
      },
    ),
    CarouselItem(
      image: const AssetImage("Assets/coustomer_service.png"),
      title: '@coskuncay published flutter_custom_carousel_slider!',
      titleTextStyle: const TextStyle(
        fontSize: 12,
        color: Colors.white,
      ),
      leftSubtitle: '11 Feb 2022',
      rightSubtitle: 'v1.0.0',
      onImageTap: (i) {
        Get.to(SupportScreen());
      },
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
              height: Get.height - 146,
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
                  InkWell(
                    splashFactory: NoSplash.splashFactory,
                    onTap: () {
                      Get.to(GameScreen(
                        gameName: "BATTLE GROUNDS MOBILE INDIA",
                      ));
                    },
                    child: Container(
                      height: 220,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                "Assets/bgmi_home.png",
                              ),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  InkWell(
                    splashFactory: NoSplash.splashFactory,
                    onTap: () {
                      Get.to(GameScreen(
                        gameName: "FREE FIRE",
                      ));
                    },
                    child: Container(
                      height: 200,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("Assets/FreeFire_home.png"),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  InkWell(
                    splashFactory: NoSplash.splashFactory,
                    onTap: () {
                      Get.to(GameScreen(
                        gameName: "LUDO",
                      ));
                    },
                    child: Padding(
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
                  ),
                  SizedBox(
                    height: 27,
                  ),
                  InkWell(
                    splashFactory: NoSplash.splashFactory,
                    onTap: () {
                      Get.to(GameScreen(
                        gameName: "CARROM",
                      ));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 175,
                            width: Get.width - 45,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              image: DecorationImage(
                                  image: AssetImage(
                                      "Assets/carrom_home_screen.jpg"),
                                  fit: BoxFit.fitWidth),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white24,
                              borderRadius: BorderRadius.circular(5)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              "How to ?",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 0,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: Divider(
                              height: 20,
                              thickness: 0.3,
                              indent: 15,
                              endIndent: 0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: GlossyCard(
                      borderWith: 0.4,
                      height: Get.height * 0.15,
                      width: Get.width * 0.89,
                      borderRadius: 15.0,
                      child: Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: () async {
                                var url = Uri.parse(
                                    "${mainController.urls["howToJoin"]}");
                                await launchUrl(url);
                              },
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  LottieBuilder.asset(
                                    "Assets/howToJoinLogo.json",
                                    height: 70,
                                    width: 70,
                                    repeat: true,
                                  ),
                                  Text(
                                    "Join",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  )
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                var url = Uri.parse(
                                    "${mainController.urls["howToPlay"]}");
                                await launchUrl(url);
                              },
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  LottieBuilder.asset(
                                    "Assets/play_home_screen.json",
                                    height: 70,
                                    width: 70,
                                    repeat: true,
                                  ),
                                  Text(
                                    "Play",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  )
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                var url = Uri.parse(
                                    "${mainController.urls["howToEarn"]}");
                                await launchUrl(url);
                              },
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  LottieBuilder.asset(
                                    "Assets/earn_home_screen.json",
                                    height: 70,
                                    width: 70,
                                    repeat: true,
                                  ),
                                  Text(
                                    "Earn",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
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
