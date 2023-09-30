import 'package:flutter/material.dart';
import 'package:gamaru_mobile_app/Componants/glossyEffect.dart';
import 'package:gamaru_mobile_app/Controllers/Main-Controller/mainController.dart';
import 'package:gamaru_mobile_app/Screens/Top-section-every/top-part.dart';
// import 'package:gamaru_mobile_app/Screens/Wallet-Screens/upi_payment_screen.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'Screens/refer_screen/refer_earn_screen.dart';
import 'Screens/watchAndEarn/watchEarn.dart';

class EarnScreen extends StatelessWidget {
  const EarnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mainController = Get.put(MainController());
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Column(
              children: [
                const TopDetails(),
                Container(
                  height: Get.height - 146,
                  padding: const EdgeInsets.only(top: 20),
                  child: ListView(
                    children: [
                      GlossyCard(
                          height: Get.height * 0.26,
                          width: Get.width * 0.95,
                          borderRadius: 10.0,
                          borderWith: 1.0,
                          child: InkWell(
                            onTap: () {
                              Get.to(const ReferAndEarn());
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                LottieBuilder.asset(
                                  "Assets/refer.json",
                                  height: 175,
                                  width: 175,
                                  repeat: false,
                                ),
                                Container(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: const Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Refer and Earn",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                          "Tell your mates about this app",
                                          style: TextStyle(
                                              color: Colors.white70,
                                              fontSize: 14),
                                        ),
                                        Text(
                                          "and get exciting reward",
                                          style: TextStyle(
                                              color: Colors.white70,
                                              fontSize: 14),
                                        )
                                      ]),
                                )
                              ],
                            ),
                          )),
                      const SizedBox(
                        height: 8,
                      ),
                      GlossyCard(
                          height: Get.height * 0.26,
                          width: Get.width * 0.95,
                          borderRadius: 10.0,
                          borderWith: 1.0,
                          child: InkWell(
                            onTap: () {
                              // Get.to(UpiScreen());
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                LottieBuilder.asset(
                                  "Assets/socal.json",
                                  height: 175,
                                  width: 175,
                                  repeat: false,
                                ),
                                Container(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: const Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Share and Earn",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                          "Share on social media about",
                                          style: TextStyle(
                                              color: Colors.white70,
                                              fontSize: 14),
                                        ),
                                        Text(
                                          "our app and earn huge",
                                          style: TextStyle(
                                              color: Colors.white70,
                                              fontSize: 14),
                                        )
                                      ]),
                                )
                              ],
                            ),
                          )),
                      const SizedBox(
                        height: 8,
                      ),
                      GlossyCard(
                          height: Get.height * 0.26,
                          width: Get.width * 0.95,
                          borderRadius: 10.0,
                          borderWith: 1.0,
                          child: InkWell(
                            onTap: () {
                              Get.to(const WatchAndEarn());
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                LottieBuilder.asset(
                                  "Assets/adWatch.json",
                                  height: 175,
                                  width: 175,
                                  repeat: false,
                                ),
                                Container(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: const Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Watch and Earn",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                          "Watch promotional videos and",
                                          style: TextStyle(
                                              color: Colors.white70,
                                              fontSize: 14),
                                        ),
                                        Text(
                                          "get exciting reward",
                                          style: TextStyle(
                                              color: Colors.white70,
                                              fontSize: 14),
                                        )
                                      ]),
                                )
                              ],
                            ),
                          )),
                      const SizedBox(
                        height: 8,
                      ),
                      InkWell(
                        onTap: () {
                          mainController.navBarIndex.value = 1;
                        },
                        child: GlossyCard(
                            height: Get.height * 0.26,
                            width: Get.width * 0.95,
                            borderRadius: 10.0,
                            borderWith: 1.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                LottieBuilder.asset(
                                  "Assets/playgame.json",
                                  height: 175,
                                  width: 175,
                                  repeat: false,
                                ),
                                Container(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Play and Earn",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        "Play your favrouit games daily",
                                        style: TextStyle(
                                            color: Colors.white70,
                                            fontSize: 14),
                                      ),
                                      Text(
                                        "and win daily",
                                        style: TextStyle(
                                            color: Colors.white70,
                                            fontSize: 14),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            )),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
