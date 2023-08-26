import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gamaru_mobile_app/Screens/Wallet-Screens/addMoney.dart';
import 'package:gamaru_mobile_app/Screens/Wallet-Screens/withdrawl.dart';
import 'package:gamaru_mobile_app/Screens/notifications-screen/notification.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class TopDetails extends StatelessWidget {
  const TopDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
      child: Column(
        children: [
          SizedBox(
              width: Get.width,
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                      height: 40,
                      width: 125,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("Assets/gamaru_text.png")))),
                  SizedBox(
                    width: Get.width * 0.02,
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(WithdrawScreen());
                    },
                    child: Container(
                      height: 28,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 78, 78, 78)
                              .withOpacity(0.9),
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                        child: Row(
                          children: [
                            LottieBuilder.asset(
                              "Assets/winning_coin.json",
                              frameRate: FrameRate.max,
                            ),
                            const SizedBox(
                              width: 2,
                            ),
                            StreamBuilder(
                              stream: FirebaseFirestore.instance
                                  .collection("user")
                                  .doc(FirebaseAuth.instance.currentUser!.email
                                      .toString())
                                  .snapshots(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  int coins =
                                      snapshot.data!.data()!["winCoins"];
                                  return Text(
                                    coins.toString(),
                                    style: const TextStyle(
                                      color: Colors.yellow,
                                    ),
                                  );
                                } else {
                                  return const Text("0");
                                }
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(AddMoney());
                    },
                    child: Container(
                      height: 28,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 78, 78, 78)
                              .withOpacity(0.9),
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                        child: Row(
                          children: [
                            LottieBuilder.asset(
                              "Assets/coin.json",
                              frameRate: FrameRate.max,
                            ),
                            const SizedBox(
                              width: 2,
                            ),
                            StreamBuilder(
                              stream: FirebaseFirestore.instance
                                  .collection("user")
                                  .doc(FirebaseAuth.instance.currentUser!.email
                                      .toString())
                                  .snapshots(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  int coins = snapshot.data!.data()!["coins"];
                                  return Text(
                                    coins.toString(),
                                    style: const TextStyle(
                                      color: Colors.yellow,
                                    ),
                                  );
                                } else {
                                  return const Text("0");
                                }
                              },
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Icon(
                              Icons.add,
                              size: 20,
                              color: Colors.green,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => Notifications());
                    },
                    child: const Icon(
                      Icons.notifications_none_rounded,
                      color: Colors.white,
                      size: 26,
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
