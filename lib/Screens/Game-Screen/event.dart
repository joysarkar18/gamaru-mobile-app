import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gamaru_mobile_app/Componants/glossyExtra.dart';
import 'package:gamaru_mobile_app/Screens/Join-now/joinNow-bgmi.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

import '../../Componants/glossyEffect.dart';

class EventCard extends StatelessWidget {
  final eventName;
  final DateTime eventTime;
  final List registerList;
  final eventMap;
  final eventWinner;
  final eventPerKill;
  final eventEntryFee;
  final eventTotalPlayers;
  final eventRegisteredPlayers;
  const EventCard(
      {super.key,
      required this.eventEntryFee,
      required this.eventMap,
      required this.eventName,
      required this.eventPerKill,
      required this.eventRegisteredPlayers,
      required this.eventTime,
      required this.eventTotalPlayers,
      required this.registerList,
      required this.eventWinner});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        GlossyCard(
            height: 510.0,
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
                          image: AssetImage("Assets/${this.eventName}.png"),
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
                          this.eventName.toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          DateFormat.yMMMEd().add_jm().format(this.eventTime),
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
                                  this.eventMap.toString(),
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
                              this.eventWinner.toString(),
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
                                  this.eventPerKill.toString(),
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
                              this.eventEntryFee.toString(),
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
                        value: this.eventRegisteredPlayers /
                            this.eventTotalPlayers,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${this.eventRegisteredPlayers.toString()}/${this.eventTotalPlayers.toString()}",
                            style: TextStyle(color: Colors.white60),
                          ),
                          Text(
                            "Only ${this.eventTotalPlayers - this.eventRegisteredPlayers} spots left",
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
                                        borderRadius: BorderRadius.circular(5),
                                        side: BorderSide(
                                            color: registerList.contains(
                                                    FirebaseAuth.instance
                                                        .currentUser!.email
                                                        .toString())
                                                ? Colors.grey
                                                : Colors.green))),
                                backgroundColor: registerList.contains(
                                        FirebaseAuth.instance.currentUser!.email
                                            .toString())
                                    ? MaterialStatePropertyAll(Colors.grey)
                                    : MaterialStatePropertyAll(Colors.green),
                                foregroundColor:
                                    MaterialStatePropertyAll(Colors.white),
                              ),
                              onPressed: () {
                                if (!registerList.contains(
                                    FirebaseAuth.instance.currentUser!.email)) {
                                  Get.to(() => BgmiJoinNow(
                                        entryFee: eventEntryFee,
                                      ));
                                }
                              },
                              child: Text(registerList.contains(FirebaseAuth
                                      .instance.currentUser!.email
                                      .toString())
                                  ? "JOINED"
                                  : "JOIN NOW")),
                        ],
                      ),
                      registerList.contains(FirebaseAuth
                              .instance.currentUser!.email
                              .toString())
                          ? Text(
                              "* Get Room ID & PASS 10 mins before the match",
                              style: TextStyle(color: Colors.red),
                            )
                          : Text(
                              "",
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
