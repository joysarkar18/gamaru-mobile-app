import 'package:flutter/material.dart';
import 'package:gamaru_mobile_app/Screens/navigation_bar.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../Componants/glossyEffect.dart';

class WithdrawComplete extends StatelessWidget {
  const WithdrawComplete({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetAnimationCurve: Curves.bounceIn,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(
            25,
          ),
        ),
      ),
      alignment: Alignment.center,
      child: GlossyCard(
        height: Get.height * .45,
        width: Get.width * .2,
        borderRadius: 20.0,
        borderWith: 0.5,
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(color: Colors.transparent),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: LottieBuilder.asset(
                        "Assets/Successfully.json",
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Text(
                        "S U C C E S S !",
                        style: TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                    const Text(
                      "Your payment of rs100 was paid to",
                      style: TextStyle(
                          color: Colors.white70, fontWeight: FontWeight.w700),
                    ),
                    const Text(
                      "tanmoysarkar06@ybl.",
                      style: TextStyle(
                          color: Colors.white70, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: Get.height * 0.04,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 18.0, bottom: 8.0),
                      child: Text(
                        "Tue,22 Aug",
                        style: TextStyle(
                            fontSize: 10,
                            color: Colors.white70,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    InkWell(
                      highlightColor: Colors.black,
                      onTap: () => Get.offAll(MainScreen()),
                      child: Container(
                        height: Get.height * .045,
                        width: Get.width * .35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.white,
                              blurStyle: BlurStyle.outer,
                              blurRadius: 0.04,
                              spreadRadius: 0.9,
                            ),
                          ],
                          gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color.fromARGB(255, 53, 25, 109),
                                Color.fromARGB(255, 73, 22, 82)
                              ]),
                        ),
                        child: const Center(
                          child: Text(
                            "Ok",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 0,
              child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.cancel,
                  color: Colors.white70,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
