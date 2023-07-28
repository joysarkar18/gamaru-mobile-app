import 'package:flutter/material.dart';
import 'package:gamaru_mobile_app/Componants/glossyEffect.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ReferAndEarn extends StatelessWidget {
  const ReferAndEarn({super.key});

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
      body: Container(
        color: Colors.black,
        width: Get.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GlossyCard(
                height: 600.0,
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
                            child: Text(
                              "30 Gold",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 19,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 22.0),
                            child: GlossyCard(
                              height: Get.height * .30,
                              width: Get.width,
                              borderRadius: 10.0,
                              borderWith: 1.0,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Color.fromARGB(180, 21, 20, 20)),
                                height: Get.height * .30,
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
                                            onTap: () {
                                              print('Ahhh');
                                            },
                                            child: Image.asset(
                                              "Assets/whatsapp.png",
                                              scale: Checkbox.width,
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              print('Uhhh');
                                            },
                                            child: Image.asset(
                                              "Assets/instagram.png",
                                              scale: Checkbox.width,
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              print('Isssh');
                                            },
                                            child: Image.asset(
                                              "Assets/telegram.png",
                                              scale: Checkbox.width,
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
                                                    print('I love you');
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
                                        style: TextStyle(color: Colors.white30),
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
                                      onTap: () {
                                        print('FuCk YoU');
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
    );
  }
}
