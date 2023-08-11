import 'package:flutter/material.dart';
import 'package:gamaru_mobile_app/Componants/glossyEffect.dart';
import 'package:gamaru_mobile_app/Componants/glossyExtra.dart';
import 'package:gamaru_mobile_app/Componants/glossy_prof.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:lottie/lottie.dart';
import 'package:random_avatar/random_avatar.dart';

import '../../Controllers/Login-Contollers/autehntication.dart';
import '../Customer Support/SupportScreen.dart';
import '../refer_screen/refer_earn_screen.dart';

class ProfileScreen1 extends StatelessWidget {
  const ProfileScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    final authentication = Get.put(Authentication());
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("Assets/bg_profile.JPG"),
                    fit: BoxFit.cover)),
          ),
          GlossyCardDarkProf(
            height: Get.height * 0.7,
            width: Get.width,
            borderRadius: 30.0,
            borderWith: 0.0,
            child: Container(),
          ),
          Positioned(
              top: Get.height - Get.height * 0.85,
              child: Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 8.0, // soften the shadow
                        spreadRadius: 0.2, //extend the shadow
                      )
                    ],
                    color: Colors.transparent,
                    border: Border.all(color: Colors.black, width: 5),
                    borderRadius: BorderRadius.all(Radius.circular(75))),
                child: RandomAvatar(
                  authentication.userEmail.value,
                ),
              )),
          Positioned(
            top: Get.height - Get.height * 0.65,
            child: Container(
              width: Get.width - 60,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Obx(
                          () => Text(
                            authentication.userEmail.value,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 45,
                    ),
                    InkWell(
                      onTap: () {
                        print('I love you');
                      },
                      child: GlossyCard(
                        borderRadius: 10.0,
                        borderWith: 1.0,
                        height: 50.0,
                        width: Get.width,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              HeroIcons.wallet,
                              color: Colors.white70,
                              size: 35,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "My Wallet",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: () {
                        print('I love you');
                        Get.to(ReferAndEarn());
                      },
                      child: GlossyCard(
                        height: 50.0,
                        width: Get.width,
                        borderRadius: 10.0,
                        borderWith: 1.0,
                        child: Container(
                          child: Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                HeroIcons.chat_bubble_bottom_center_text,
                                color: Colors.white70,
                                size: 35,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                "Refer & Earn",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: () {
                        print('I love you');
                        Get.to(ReferAndEarn());
                      },
                      child: GlossyCard(
                        borderRadius: 10.0,
                        borderWith: 1.0,
                        height: 50.0,
                        width: Get.width,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.notifications_rounded,
                              color: Colors.white70,
                              size: 35,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Notifications",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: () {
                        print('I love you');
                        Get.to(SupportScreen());
                      },
                      child: GlossyCard(
                        borderRadius: 10.0,
                        borderWith: 1.0,
                        height: 50.0,
                        width: Get.width,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.headphones,
                              color: Colors.white70,
                              size: 35,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Customer Support",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: () {
                        print('I love you');
                        authentication.logOut();
                      },
                      child: GlossyCard(
                        borderRadius: 10.0,
                        borderWith: 1.0,
                        height: 50.0,
                        width: Get.width,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.logout,
                              color: Colors.white70,
                              size: 35,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Logout",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ]),
            ),
          )
        ],
      ),
    );
  }
}
