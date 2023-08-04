import 'package:flutter/material.dart';
import 'package:gamaru_mobile_app/Componants/glossyEffect.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:lottie/lottie.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: GlossyCard(
            borderWith: 0.4,
            height: Get.height * 0.9,
            width: Get.width * 0.50,
            borderRadius: 15.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 45,
                ),
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      // color: Colors.white,
                      gradient: LinearGradient(
                          begin: Alignment.center,
                          end: AlignmentDirectional.bottomCenter,
                          colors: [Colors.white, Colors.purpleAccent]),
                      borderRadius: BorderRadius.circular(40)),
                  child: LottieBuilder.asset(
                    "Assets/gamer_profile_page.json",
                    frameRate: FrameRate.max,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Example@mail.com",
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 5,
                ),
                Divider(
                  thickness: .25,
                  color: Colors.white,
                  endIndent: 20,
                  indent: 20,
                ),
                SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () {
                    print('I love you');
                  },
                  child: Container(
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          HeroIcons.wallet,
                          color: Colors.white70,
                          size: 40,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Wallet",
                          style: TextStyle(color: Colors.white, fontSize: 20),
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
                  },
                  child: Container(
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          HeroIcons.chat_bubble_bottom_center_text,
                          color: Colors.white70,
                          size: 40,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Refer & Invite",
                          style: TextStyle(color: Colors.white, fontSize: 20),
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
                  },
                  child: Container(
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.help,
                          color: Colors.white70,
                          size: 40,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Help Center",
                          style: TextStyle(color: Colors.white, fontSize: 20),
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
                  },
                  child: Container(
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.logout,
                          color: Colors.white70,
                          size: 40,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Logout",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height * .2,
                ),
                Text(
                  "Follow us on",
                  style: TextStyle(color: Colors.white60),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Logo(
                        Logos.facebook_logo,
                        size: 20,
                      ),
                      Logo(
                        Logos.instagram,
                        size: 20,
                      ),
                      Logo(
                        Logos.linkedin,
                        size: 20,
                      ),
                      Logo(
                        Logos.twitter,
                        size: 20,
                      ),
                      Logo(
                        Logos.youtube,
                        size: 20,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
