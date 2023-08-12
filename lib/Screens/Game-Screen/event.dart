import 'package:flutter/material.dart';
import 'package:gamaru_mobile_app/Componants/glossyExtra.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../Componants/glossyEffect.dart';

class EventCard extends StatelessWidget {
  const EventCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        GlossyCard(
            height: 500.0,
            width: Get.width * 0.95,
            borderRadius: 10.0,
            borderWith: 2.0,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 2.1, vertical: 2),
                  width: Get.width * 0.95,
                  height: 220,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8)),
                      image: DecorationImage(
                          image: AssetImage("Assets/squad_bgmi.png"),
                          fit: BoxFit.cover)),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("Assets/g_Logo.png"))),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "BGMI SQUAD MATCH",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Time - 11/09/23 , 10 AM",
                          style: TextStyle(color: Colors.white60),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 30,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          GlossyCard(
                            borderRadius: 5.0,
                            borderWith: 1.0,
                            height: 40.0,
                            width: 150.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.map_rounded,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                Text(
                                  "MAP - ",
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  "ERANGLE",
                                  style: TextStyle(color: Colors.blue),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      GlossyCard(
                        borderRadius: 5.0,
                        borderWith: 1.0,
                        height: 40.0,
                        width: 150.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                                height: 22,
                                width: 22,
                                image: AssetImage("Assets/trophy-128.png")),
                            SizedBox(
                              width: 3,
                            ),
                            Text(
                              "WINNER - ",
                              style: TextStyle(color: Colors.white),
                            ),
                            LottieBuilder.asset(
                              "Assets/coin.json",
                              frameRate: FrameRate.max,
                            ),
                            Text(
                              "300",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 234, 45)),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          GlossyCard(
                            borderRadius: 5.0,
                            borderWith: 1.0,
                            height: 40.0,
                            width: 150.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.tag_rounded,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                Text(
                                  "PER KILL - ",
                                  style: TextStyle(color: Colors.white),
                                ),
                                LottieBuilder.asset(
                                  "Assets/coin.json",
                                  animate: false,
                                ),
                                Text(
                                  "7",
                                  style: TextStyle(color: Colors.yellow),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      GlossyCard(
                        borderRadius: 5.0,
                        borderWith: 1.0,
                        height: 40.0,
                        width: 150.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 3,
                            ),
                            Text(
                              "ENTRY FEE - ",
                              style: TextStyle(color: Colors.white),
                            ),
                            LottieBuilder.asset(
                              "Assets/coin.json",
                              animate: false,
                            ),
                            Text(
                              "10",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 234, 45)),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: [
                      LinearProgressIndicator(
                        minHeight: 8,
                        value: 0.7,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "34/50",
                            style: TextStyle(color: Colors.white60),
                          ),
                          Text(
                            "Only 16 spots left",
                            style: TextStyle(color: Colors.white60),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          side:
                                              BorderSide(color: Colors.blue))),
                                  backgroundColor:
                                      MaterialStatePropertyAll(Colors.blue),
                                  foregroundColor:
                                      MaterialStatePropertyAll(Colors.white)),
                              onPressed: () {},
                              child: Text("DETAILS")),
                          ElevatedButton(
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          side:
                                              BorderSide(color: Colors.green))),
                                  backgroundColor:
                                      MaterialStatePropertyAll(Colors.green),
                                  foregroundColor:
                                      MaterialStatePropertyAll(Colors.white)),
                              onPressed: () {},
                              child: Text("JOIN NOW")),
                        ],
                      )
                    ],
                  ),
                )
              ],
            )),
      ],
    );
  }
}
