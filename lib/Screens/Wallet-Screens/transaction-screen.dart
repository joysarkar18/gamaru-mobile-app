import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gamaru_mobile_app/Componants/glossyEffect.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "TRANSACTIONS",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
          height: Get.height,
          width: Get.width,
          child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("user transactions")
                .doc(FirebaseAuth.instance.currentUser!.email.toString())
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List l = snapshot.data!.data()!["transactions"];
                if (l.isEmpty) {
                  return Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: Get.height * 0.26,
                        ),
                        LottieBuilder.asset(
                          "Assets/NoData.json",
                          height: 200,
                          width: 300,
                        ),
                        Text(
                          "No Transaction yet!",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
                  );
                } else {
                  return ListView(
                    children: l.map((e) {
                      Timestamp t = e["time"];
                      DateTime dt = t.toDate();
                      return Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          GlossyCard(
                              height: 80.0,
                              width: Get.width,
                              borderRadius: 10.0,
                              borderWith: 2.0,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            e["reason"].toString(),
                                            style: const TextStyle(
                                                color: Colors.white60,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            DateFormat.yMMMEd()
                                                .add_jm()
                                                .format(dt),
                                            style: const TextStyle(
                                                color: Colors.white60),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            e["add"] ? "+" : "-",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 30),
                                          ),
                                          SizedBox(
                                            width: 4,
                                          ),
                                          e["reason"] == "Withdraw"
                                              ? LottieBuilder.asset(
                                                  "Assets/winning_coin.json",
                                                  animate: false,
                                                )
                                              : LottieBuilder.asset(
                                                  "Assets/coin.json",
                                                  animate: false,
                                                ),
                                          const SizedBox(
                                            width: 3,
                                          ),
                                          Text(
                                            (e["amount"] + e["fee"]).toString(),
                                            style: const TextStyle(
                                                color: Colors.white70,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      )
                                    ]),
                              )),
                        ],
                      );
                    }).toList(),
                  );
                }
              } else {
                return SizedBox(
                    height: 100,
                    width: 100,
                    child: CircularProgressIndicator());
              }
            },
          )),
    );
  }
}
