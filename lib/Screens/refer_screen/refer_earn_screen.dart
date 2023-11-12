import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gamaru_mobile_app/Componants/glossyEffect.dart';
import 'package:gamaru_mobile_app/Controllers/ReferalController/referalController.dart';
import 'package:gamaru_mobile_app/Screens/refer_screen/referrals_list.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:lottie/lottie.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class ReferAndEarn extends StatefulWidget {
  const ReferAndEarn({super.key});

  @override
  State<ReferAndEarn> createState() => _ReferAndEarnState();
}

class _ReferAndEarnState extends State<ReferAndEarn> {
  final referalController = Get.put(ReferalController());

  @override
  void initState() {
    super.initState();
    referalController.getIdAmount();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: BackButton(
            color: Colors.white,
          ),
          title: Text(
            "Refer and Earn",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: Obx(
          () => Container(
            color: Colors.black,
            width: Get.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GlossyCard(
                    height: Get.height * .82,
                    width: Get.width * 0.95,
                    borderRadius: 10.0,
                    borderWith: 1.0,
                    child: Container(
                      alignment: Alignment.topCenter,
                      width: Get.width * .79,
                      height: Get.height,
                      color: Colors.transparent,
                      child: Column(
                        children: [
                          LottieBuilder.asset(
                            "Assets/refer.json",
                            height: 180,
                            width: 180,
                            repeat: false,
                          ),
                          Text(
                            "Refer friends and earn!",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          Text(
                            "For every referral you and your ",
                            style: TextStyle(
                              color: Color.fromARGB(188, 255, 255, 255),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "friend get",
                                style: TextStyle(
                                  color: Color.fromARGB(188, 255, 255, 255),
                                ),
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: StreamBuilder(
                                    stream: FirebaseFirestore.instance
                                        .collection("ReferalAmount")
                                        .doc("refAmount")
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        return Text(
                                          snapshot.data!
                                                  .data()!["amount"]
                                                  .toString() +
                                              " Play Coins",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 19,
                                              fontWeight: FontWeight.w700),
                                        );
                                      } else {
                                        return Text("");
                                      }
                                    },
                                  )),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          GlossyCard(
                            borderRadius: 5.0,
                            borderWith: 2.0,
                            height: 50.0,
                            width: 250.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Your Code : ${referalController.refId.value}",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                IconButton(
                                    onPressed: () async {
                                      await Clipboard.setData(ClipboardData(
                                              text: referalController
                                                  .refId.value))
                                          .then((value) {
                                        Get.snackbar(
                                          "Copied to Clipboard",
                                          "",
                                          snackPosition: SnackPosition.BOTTOM,
                                          colorText: Colors.green,
                                        );
                                      });
                                    },
                                    icon: Icon(Icons.copy))
                              ],
                            ),
                          ),
                          Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 22.0),
                                child: GlossyCard(
                                  height: Get.height * .36,
                                  width: Get.width,
                                  borderRadius: 10.0,
                                  borderWith: 1.0,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Color.fromARGB(180, 21, 20, 20)),
                                    height: Get.height * .36,
                                    width: Get.width,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Text(
                                            "Share the referral link via",
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    188, 255, 255, 255)),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              InkWell(
                                                onTap: () async {
                                                  String refMessage = ''''Hey,

I'm loving "Gamaru" – it's a blast! 🎮
play BGMI, Free Fire and many more and win real cash!💸🔥

Join Gamaru and let's both get ${referalController.refAmount.value.toString()} play coins. Just download Gamaru apk : www.gamaru.online and use my code: ${referalController.refId.value} .

Game on!''';
                                                  FocusManager
                                                      .instance.primaryFocus
                                                      ?.unfocus();

                                                  final message =
                                                      Uri.encodeFull(
                                                          refMessage);
                                                  final url =
                                                      "https://wa.me/?text=$message";

                                                  try {
                                                    launch(url);
                                                  } catch (e) {
                                                    //To handle error and display error message
                                                    print("error");
                                                  }
                                                },
                                                child: Logo(
                                                  Logos.whatsapp,
                                                  size: 40,
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () async {
                                                  String refMessage = ''''Hey,

I'm loving "Gamaru" – it's a blast! 🎮
play BGMI, Free Fire and many more and win real cash!💸🔥

Join Gamaru and let's both get ${referalController.refAmount.value.toString()} play coins. Just download Gamaru apk : www.gamaru.online and use my code: ${referalController.refId.value} .

Game on!''';
                                                  Share.share(refMessage,
                                                      subject:
                                                          'Gamaru Referal');
                                                },
                                                child: Logo(
                                                  Logos.facebook_messenger,
                                                  size: 40,
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () async {
                                                  String refMessage = ''''Hey,

I'm loving "Gamaru" – it's a blast! 🎮
play BGMI, Free Fire and many more and win real cash!💸🔥

Join Gamaru and let's both get ${referalController.refAmount.value.toString()} play coins. Just download Gamaru apk : www.gamaru.online and use my code: ${referalController.refId.value} .

Game on!''';
                                                  Share.share(refMessage,
                                                      subject:
                                                          'Gamaru Referal');
                                                },
                                                child: Logo(
                                                  Logos.telegram,
                                                  size: 40,
                                                ),
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                    color: Color.fromARGB(
                                                        108, 87, 89, 2),
                                                    shape: BoxShape.circle),
                                                child: Column(
                                                  children: [
                                                    IconButton(
                                                      onPressed: () {
                                                        String refMessage =
                                                            ''''Hey,

I'm loving "Gamaru" – it's a blast! 🎮
play BGMI, Free Fire and many more and win real cash!💸🔥

Join Gamaru and let's both get ${referalController.refAmount.value.toString()} play coins. Just download Gamaru apk : www.gamaru.online and use my code: ${referalController.refId.value} .

Game on!''';
                                                        Share.share(refMessage,
                                                            subject:
                                                                'Gamaru Referal');
                                                      },
                                                      icon: Icon(
                                                        Icons.more_horiz,
                                                        color: Colors.white,
                                                        size: 40,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Row(children: <Widget>[
                                          Expanded(
                                            child: Container(
                                                margin: const EdgeInsets.only(
                                                    left: 10.0, right: 20.0),
                                                child: const Divider(
                                                  color: Colors.white30,
                                                  height: 36,
                                                )),
                                          ),
                                          const Text(
                                            "or",
                                            style: TextStyle(
                                                color: Colors.white30),
                                          ),
                                          Expanded(
                                            child: Container(
                                                margin: const EdgeInsets.only(
                                                    left: 20.0, right: 10.0),
                                                child: const Divider(
                                                  color: Colors.white30,
                                                  height: 36,
                                                )),
                                          ),
                                        ]),
                                        InkWell(
                                          onTap: () async {
                                            String refMessage = ''''Hey,

I'm loving "Gamaru" – it's a blast! 🎮
play BGMI, Free Fire and many more and win real cash!💸🔥

Join Gamaru and let's both get ${referalController.refAmount.value.toString()} play coins. Just use my referral link: www.gamaru.online and code: ${referalController.refId.value} .

Game on!''';
                                            await Clipboard.setData(
                                                    ClipboardData(
                                                        text: refMessage))
                                                .then((value) {
                                              Get.snackbar(
                                                "Copied to Clipboard",
                                                "",
                                                snackPosition:
                                                    SnackPosition.BOTTOM,
                                                colorText: Colors.green,
                                              );
                                            });
                                          },
                                          child: Container(
                                            width: Get.width * 0.59,
                                            height: 50,
                                            decoration: const BoxDecoration(
                                                color: Colors.blue,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10))),
                                            child: const Center(
                                                child: Text(
                                              "COPY REFERRAL LINK",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 18),
                                            )),
                                          ),
                                        ),
                                        Spacer(),
                                        InkWell(onTap: () {
                                          Get.to(ReferralsList());
                                        },
                                          child: Container(
                                              width: Get.width * 0.59,
                                              height: 50,
                                              decoration: const BoxDecoration(
                                                  color: Colors.blue,
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(10))),
                                              child: const Center(
                                                  child: Text(
                                                "YOUR REFERRALS",
                                                style: TextStyle(
                                                  letterSpacing: 0,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 18),
                                              )),
                                            ),
                                        ),Spacer(),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
