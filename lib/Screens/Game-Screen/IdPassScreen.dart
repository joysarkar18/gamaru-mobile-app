import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gamaru_mobile_app/Componants/glossyEffect.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class IdPass extends StatelessWidget {
  final String eventName;
  final String id;
  final String pass;
  const IdPass(
      {super.key,
      required this.id,
      required this.pass,
      required this.eventName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          backgroundColor: Colors.black,
          iconTheme: const IconThemeData(color: Colors.white70),
          title: Text(
            eventName,
            style:
                TextStyle(color: Colors.white70, fontWeight: FontWeight.w600),
          )),
      body: SizedBox(
        width: Get.width,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          LottieBuilder.asset(
            "Assets/howToJoinLogo.json",
            height: 250,
            frameRate: FrameRate.max,
          ),
          GlossyCard(
              height: 70.0,
              width: Get.width * 0.9,
              borderRadius: 20.0,
              borderWith: 2.0,
              child: Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 1,
                  ),
                  Text(
                    "Id : ${id}",
                    style: TextStyle(color: Colors.white, fontSize: 28),
                  ),
                  SizedBox(
                    width: 1,
                  ),
                  IconButton(
                      onPressed: () async {
                        await Clipboard.setData(ClipboardData(text: id))
                            .then((_) {
                          Get.snackbar(
                            "Id Copied",
                            "",
                            snackPosition: SnackPosition.BOTTOM,
                            colorText: Colors.green,
                          );
                        });
                      },
                      icon: Icon(Icons.copy))
                ],
              ))),
          SizedBox(
            height: 20,
          ),
          GlossyCard(
              height: 70.0,
              width: Get.width * 0.9,
              borderRadius: 20.0,
              borderWith: 2.0,
              child: Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 1,
                  ),
                  Text(
                    "Password : ${pass}",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  SizedBox(
                    width: 1,
                  ),
                  IconButton(
                      onPressed: () async {
                        await Clipboard.setData(ClipboardData(text: pass))
                            .then((value) {
                          Get.snackbar(
                            "Password Copied",
                            "",
                            snackPosition: SnackPosition.BOTTOM,
                            colorText: Colors.green,
                          );
                        });
                      },
                      icon: Icon(Icons.copy))
                ],
              ))),
          SizedBox(
            height: 30,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "*JOIN AS SOON AS POSSIABLE",
              style: TextStyle(color: Colors.orange, fontSize: 20),
            ),
          ),
        ]),
      ),
    );
  }
}
