import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gamaru_mobile_app/Componants/glossyExtra.dart';
import 'package:gamaru_mobile_app/Screens/Game-Screen/IdPassScreen.dart';
import 'package:gamaru_mobile_app/Screens/Game-Screen/details_screen.dart';
import 'package:gamaru_mobile_app/Screens/Join-now/joinNow-bgmi.dart';
import 'package:gamaru_mobile_app/Screens/Join-now/joinNow-duo.dart';
import 'package:gamaru_mobile_app/Screens/Join-now/joinNow-squad.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

import '../../Componants/glossyEffect.dart';

class EventCard extends StatelessWidget {
  final eventName;
  final int index;
  final DateTime eventTime;
  final List registerList;
  final eventMap;
  final eventWinner;
  final eventPerKill;
  final eventEntryFee;
  final eventTotalPlayers;
  final eventRegisteredPlayers;
  final id;
  final pass;
  const EventCard(
      {super.key,
      required this.index,
      required this.eventEntryFee,
      required this.eventMap,
      required this.eventName,
      required this.eventPerKill,
      required this.eventRegisteredPlayers,
      required this.eventTime,
      required this.eventTotalPlayers,
      required this.registerList,
      required this.eventWinner,
      required this.id,
      required this.pass});

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
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("Assets/g_Logo.png"))),
                    ),
                    const SizedBox(
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
                              this.eventEntryFee.toString() == "0"
                                  ? "FREE"
                                  : this.eventEntryFee.toString(),
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
                              onPressed: () {
                                Get.to(DetailsScreen());
                              },
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
                                                ? id != ""
                                                    ? Color.fromARGB(
                                                        255, 178, 9, 205)
                                                    : Colors.grey
                                                : Colors.green))),
                                backgroundColor: registerList.contains(
                                        FirebaseAuth.instance.currentUser!.email
                                            .toString())
                                    ? id != ""
                                        ? const MaterialStatePropertyAll(
                                            Color.fromARGB(255, 178, 9, 205))
                                        : MaterialStatePropertyAll(Colors.grey)
                                    : MaterialStatePropertyAll(Colors.green),
                                foregroundColor:
                                    MaterialStatePropertyAll(Colors.white),
                              ),
                              onPressed: () {
                                if (registerList.length >= eventTotalPlayers) {
                                  Get.snackbar("EVENT IS FULL",
                                      "Maximum number of players has been joined",
                                      colorText: Colors.red);
                                } else {
                                  if (!registerList.contains(FirebaseAuth
                                          .instance.currentUser!.email) &&
                                      (registerList.length <
                                          eventTotalPlayers)) {
                                    if (eventName == "FREE FIRE SOLO MATCH") {
                                      Get.to(() => BgmiJoinNow(
                                            index: index,
                                            entryFee: eventEntryFee,
                                            dt: eventTime,
                                            eventName: eventName,
                                          ));
                                    } else if (eventName == "BGMI SOLO MATCH") {
                                      Get.to(() => BgmiJoinNow(
                                            index: index,
                                            entryFee: eventEntryFee,
                                            dt: eventTime,
                                            eventName: eventName,
                                          ));
                                    } else if (eventName == "BGMI DUO MATCH") {
                                      Get.to(() => JoinNowDuo(
                                            index: index,
                                            entryFee: eventEntryFee,
                                            dt: eventTime,
                                            eventName: eventName,
                                          ));
                                    } else if (eventName ==
                                        "BGMI SQUAD MATCH") {
                                      Get.to(() => JoinNowSquad(
                                            index: index,
                                            entryFee: eventEntryFee,
                                            dt: eventTime,
                                            eventName: eventName,
                                          ));
                                    } else if (eventName ==
                                        "FREE FIRE DUO MATCH") {
                                      Get.to(() => JoinNowDuo(
                                            index: index,
                                            entryFee: eventEntryFee,
                                            dt: eventTime,
                                            eventName: eventName,
                                          ));
                                    } else if (eventName ==
                                        "FREE FIRE SQUAD MATCH") {
                                      Get.to(() => JoinNowSquad(
                                            index: index,
                                            entryFee: eventEntryFee,
                                            dt: eventTime,
                                            eventName: eventName,
                                          ));
                                    } else {}
                                  } else {
                                    if (id != "") {
                                      Get.to(() => IdPass(
                                            registeredPlayers: registerList,
                                            id: id,
                                            pass: pass,
                                            eventName: eventName,
                                            email: FirebaseAuth
                                                .instance.currentUser!.email
                                                .toString(),
                                          ));
                                    }
                                  }
                                }
                              },
                              child: Text(registerList.contains(FirebaseAuth
                                      .instance.currentUser!.email
                                      .toString())
                                  ? id != "" &&
                                          registerList.contains(FirebaseAuth
                                              .instance.currentUser!.email
                                              .toString())
                                      ? "GET ID PASS"
                                      : "JOINED"
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
