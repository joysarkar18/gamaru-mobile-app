import 'package:flutter/material.dart';
import 'package:gamaru_mobile_app/Componants/glossyEffect.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

class ResultCard extends StatelessWidget {
  final String eventName;
  final String name1;
  final String name2;
  final String name3;
  final String prize1;
  final String prize2;
  final String prize3;
  final DateTime date;

  const ResultCard(
      {super.key,
      required this.date,
      required this.eventName,
      required this.name1,
      required this.name2,
      required this.name3,
      required this.prize1,
      required this.prize2,
      required this.prize3});

  @override
  Widget build(BuildContext context) {
    return GlossyCard(
        height: 250.0,
        width: Get.width * 0.95,
        borderRadius: 10.0,
        borderWith: 2.0,
        child: SizedBox(
          height: 300,
          child: Column(children: [
            const SizedBox(
              height: 20,
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
                      eventName,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      DateFormat.yMMMEd().add_jm().format(date),
                      style: const TextStyle(color: Colors.white60),
                    )
                  ],
                ),
                const SizedBox(
                  width: 30,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40, top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 140,
                    child: Column(
                      children: [
                        const Text(
                          "Name",
                          style: TextStyle(
                              color: Colors.cyan,
                              fontWeight: FontWeight.w700,
                              fontSize: 18),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 12),
                          height: 2,
                          width: 90,
                          color: Colors.cyan,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: Row(
                                children: [
                                  Image.asset(
                                    "Assets/golden_trophy.png",
                                    height: 18,
                                    color: Colors.amber,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 4),
                                    child: Text(
                                      name1,
                                      style: const TextStyle(
                                          color: Colors.white70),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: Row(
                                children: [
                                  Image.asset(
                                    "Assets/golden_trophy.png",
                                    height: 18,
                                    color: const Color.fromARGB(
                                        255, 170, 166, 166),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 4),
                                    child: Text(
                                      name2,
                                      style: const TextStyle(
                                          color: Colors.white70),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  "Assets/golden_trophy.png",
                                  height: 18,
                                  color: const Color.fromARGB(255, 103, 58, 11),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 4),
                                  child: Text(
                                    name3,
                                    style:
                                        const TextStyle(color: Colors.white70),
                                  ),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 140,
                    child: Column(
                      children: [
                        const Text(
                          "Prize",
                          style: TextStyle(
                              color: Colors.cyan,
                              fontWeight: FontWeight.w700,
                              fontSize: 18),
                        ),
                        Container(
                          height: 2,
                          width: 90,
                          margin: const EdgeInsets.only(bottom: 12),
                          color: Colors.cyan,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                                padding: const EdgeInsets.only(bottom: 16),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    LottieBuilder.asset(
                                      "Assets/coin.json",
                                      animate: false,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 2),
                                      child: Text(
                                        prize1,
                                        style: const TextStyle(
                                            color: Colors.yellow),
                                      ),
                                    )
                                  ],
                                )),
                            Padding(
                                padding: const EdgeInsets.only(bottom: 16),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    LottieBuilder.asset(
                                      "Assets/coin.json",
                                      animate: false,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 2),
                                      child: Text(
                                        prize2,
                                        style: const TextStyle(
                                            color: Colors.yellow),
                                      ),
                                    )
                                  ],
                                )),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                LottieBuilder.asset(
                                  "Assets/coin.json",
                                  animate: false,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 2),
                                  child: Text(
                                    prize3,
                                    style:
                                        const TextStyle(color: Colors.yellow),
                                  ),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ]),
        ));
  }
}
