import 'package:flutter/material.dart';
import 'package:gamaru_mobile_app/Componants/glossyEffect.dart';
import 'package:gamaru_mobile_app/Controllers/Login-Contollers/autehntication.dart';
import 'package:gamaru_mobile_app/Screens/Top-section-every/top-part.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class EarnScreen extends StatelessWidget {
  const EarnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authentication = Get.put(Authentication());
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.only(top: 5, left: 10, right: 10),
            height: Get.height,
            child: Column(
              children: [
                SizedBox(
                    width: Get.width,
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            )),
                        SizedBox(
                          width: Get.width * 0.5,
                        ),
                        Container(
                          height: 28,
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 78, 78, 78)
                                  .withOpacity(0.9),
                              borderRadius: BorderRadius.circular(15)),
                          child: Center(
                            child: Row(
                              children: [
                                LottieBuilder.asset(
                                  "Assets/coin.json",
                                  frameRate: FrameRate.max,
                                ),
                                SizedBox(
                                  width: 1,
                                ),
                                Text(
                                  "100",
                                  style: TextStyle(color: Colors.yellow),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Icon(
                          Icons.notifications_none_rounded,
                          color: Colors.white,
                          size: 26,
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ));
  }
}
