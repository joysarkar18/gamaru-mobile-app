import 'package:flutter/material.dart';
import 'package:gamaru_mobile_app/Componants/glossyEffect.dart';
import 'package:gamaru_mobile_app/Controllers/Main-Controller/mainController.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({super.key});

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  MainController mainController = Get.put(MainController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          iconTheme: const IconThemeData(color: Colors.white)),
      backgroundColor: Colors.black,
      body: SafeArea(
          child: SingleChildScrollView(
        child: SizedBox(
          height: Get.height,
          width: Get.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
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
                    child: LottieBuilder.asset(
                  "Assets/support_lot.json",
                  frameRate: FrameRate.max,
                )),
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
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () async {
                      //To remove the keyboard when button is pressed
                      FocusManager.instance.primaryFocus?.unfocus();

                      var whatsappUrl =
                          "whatsapp://send?phone=+91${mainController.urls["wpNo"]}";
                      try {
                        launch(whatsappUrl);
                      } catch (e) {
                        //To handle error and display error message
                        print("error");
                      }
                    },
                    child: GlossyCard(
                        height: 55.0,
                        width: 150.0,
                        borderRadius: 10.0,
                        borderWith: 1.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Logo(
                              Logos.whatsapp,
                              size: 30,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                              "Chat with us",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          ],
                        )),
                  ),
                  InkWell(
                    onTap: () async {
                      String email = Uri.encodeComponent(
                          "${mainController.urls["email"]}");
                      String subject = Uri.encodeComponent("Gamaru Support");
                      String body = Uri.encodeComponent("");
                      print(subject); //output: Hello%20Flutter
                      Uri mail = Uri.parse(
                          "mailto:$email?subject=$subject&body=$body");
                      if (await launchUrl(mail)) {
                        //email app opened
                      } else {
                        //email app is not opened
                      }
                    },
                    child: GlossyCard(
                        height: 55.0,
                        width: 150.0,
                        borderRadius: 10.0,
                        borderWith: 1.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Logo(
                              Logos.gmail,
                              size: 30,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                              "Mail us",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          ],
                        )),
                  ),
                ],
              ),
              const SizedBox(
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
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                        onTap: () async {
                          var url = Uri.parse(
                              "${mainController.urls["facebookUrl"]}");
                          await launchUrl(url);
                        },
                        child: Logo(Logos.facebook_logo)),
                    InkWell(
                        onTap: () async {
                          var url =
                              Uri.parse("${mainController.urls["instaUrl"]}");
                          await launchUrl(url);
                        },
                        child: Logo(Logos.instagram)),
                    InkWell(
                        onTap: () async {
                          var url = Uri.parse(
                              "${mainController.urls["linkedinUrl"]}");
                          await launchUrl(url);
                        },
                        child: Logo(Logos.linkedin)),
                    InkWell(
                        onTap: () async {
                          var url =
                              Uri.parse("${mainController.urls["twitterUrl"]}");
                          await launchUrl(url);
                        },
                        child: Logo(Logos.twitter)),
                    InkWell(
                        onTap: () async {
                          var url =
                              Uri.parse("${mainController.urls["youtubeUrl"]}");
                          await launchUrl(url);
                        },
                        child: Logo(Logos.youtube)),
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
