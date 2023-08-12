import 'package:flutter/material.dart';
import 'package:gamaru_mobile_app/Componants/glossyExtra.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../Componants/glossyEffect.dart';

class EventCard extends StatelessWidget {
  const EventCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GlossyCard(
        height: 400.0,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                        style:
                            TextStyle(color: Color.fromARGB(255, 255, 234, 45)),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ));
  }
}
