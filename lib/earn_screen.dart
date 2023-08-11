import 'package:flutter/material.dart';
import 'package:gamaru_mobile_app/Componants/glossyEffect.dart';
import 'package:gamaru_mobile_app/Controllers/Login-Contollers/autehntication.dart';
import 'package:gamaru_mobile_app/Screens/Top-section-every/top-part.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'Screens/refer_screen/refer_earn_screen.dart';
import 'Screens/watchAndEarn/watchEarn.dart';

class EarnScreen extends StatelessWidget {
  const EarnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authentication = Get.put(Authentication());
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
                    GlossyCard(
                        height: 200.0,
                        width: Get.width * 0.95,
                        borderRadius: 10.0,
                        borderWith: 1.0,
                        child: InkWell(
                          onTap: () {
                            Get.to(ReferAndEarn());
                          },
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: LottieBuilder.asset(
                                    "Assets/refer.json",
                                    height: 180,
                                    width: 180,
                                    repeat: false,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(right: 10),
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
                          ),
                        )),
                    SizedBox(
                      height: 8,
                    ),
                    GlossyCard(
                        height: 200.0,
                        width: Get.width * 0.95,
                        borderRadius: 10.0,
                        borderWith: 1.0,
                        child: InkWell(
                          onTap: () {
                            // Get.to(WatchAndEarn());
                          },
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: LottieBuilder.asset(
                                    "Assets/socal.json",
                                    height: 180,
                                    width: 180,
                                    repeat: false,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(right: 10),
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
                          ),
                        )),
                    SizedBox(
                      height: 8,
                    ),
                    GlossyCard(
                        height: 200.0,
                        width: Get.width * 0.95,
                        borderRadius: 10.0,
                        borderWith: 1.0,
                        child: InkWell(
                          onTap: () {
                            Get.to(WatchAndEarn());
                          },
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: LottieBuilder.asset(
                                    "Assets/adWatch.json",
                                    height: 180,
                                    width: 180,
                                    repeat: false,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(right: 10),
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
                          ),
                        )),
                    SizedBox(
                      height: 8,
                    ),
                    GlossyCard(
                        height: 200.0,
                        width: Get.width * 0.95,
                        borderRadius: 10.0,
                        borderWith: 1.0,
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: LottieBuilder.asset(
                                  "Assets/playgame.json",
                                  height: 180,
                                  width: 180,
                                  repeat: false,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(right: 10),
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
                                    ]),
                              )
                            ],
                          ),
                        )),
                    SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
