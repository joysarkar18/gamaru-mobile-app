import 'package:flutter/material.dart';
import 'package:gamaru_mobile_app/Componants/glossyEffect.dart';
import 'package:gamaru_mobile_app/Componants/glossyExtra.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:lottie/lottie.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          height: Get.height,
          width: Get.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 40,
              ),
              const Text(
                "Request Help",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
              Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(125),
                ),
                child: Center(
                    child: LottieBuilder.asset("Assets/support_lot.json")),
              ),
              const Text(
                "How Can We Help You",
                style: TextStyle(color: Colors.white70, fontSize: 24),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "It looks like you are expriencing problem",
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
              const Text(
                "using our system. We are here to help",
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
              const Text(
                "you. Please get in touch with us and give",
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
              const Text(
                "us a chance to improve.",
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GlossyCard(
                      height: 55.0,
                      width: 150.0,
                      borderRadius: 10.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Logo(
                            Logos.whatsapp,
                            size: 30,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Chat with us",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        ],
                      ),
                      borderWith: 1.0),
                  GlossyCard(
                      height: 55.0,
                      width: 150.0,
                      borderRadius: 10.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Logo(
                            Logos.gmail,
                            size: 30,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Mail us",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        ],
                      ),
                      borderWith: 1.0),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Column(children: <Widget>[
                Row(children: <Widget>[
                  Expanded(
                    child: Container(
                        margin: const EdgeInsets.only(left: 80.0, right: 20.0),
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
                        margin: const EdgeInsets.only(left: 20.0, right: 80.0),
                        child: const Divider(
                          color: Colors.white30,
                          height: 36,
                        )),
                  ),
                ]),
              ]),
              const Text(
                "Follow us on",
                style: TextStyle(color: Colors.white60),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Logo(Logos.facebook_logo),
                    Logo(Logos.instagram),
                    Logo(Logos.linkedin),
                    Logo(Logos.twitter),
                    Logo(Logos.youtube),
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
