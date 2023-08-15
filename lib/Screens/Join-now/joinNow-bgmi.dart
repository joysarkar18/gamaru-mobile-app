import 'package:flutter/material.dart';
import 'package:gamaru_mobile_app/Componants/glossyEffect.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

bool isChecked = false;

class BgmiJoinNow extends StatefulWidget {
  final int entryFee;
  const BgmiJoinNow({super.key, required this.entryFee});

  @override
  State<BgmiJoinNow> createState() => _BgmiJoinNowState();
}

class _BgmiJoinNowState extends State<BgmiJoinNow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "JOIN NOW",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
          height: Get.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 300,
                child: Center(
                  child: LottieBuilder.asset(
                    "Assets/JoinNow.json",
                    frameRate: FrameRate.max,
                  ),
                ),
              ),
              GlossyCard(
                height: 200.0,
                width: Get.width - 30.0,
                borderRadius: 10.0,
                borderWith: 2.0,
                child: Form(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15, right: 15, top: 20, bottom: 0),
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          style: const TextStyle(
                              color: Colors.white60,
                              decoration: TextDecoration.none),
                          decoration: const InputDecoration(
                            fillColor: Colors.transparent,
                            hintText: "ENTER YOUR BGMI ID NAME",
                            hintStyle:
                                TextStyle(color: Colors.white60, fontSize: 15),
                            prefixIcon: Icon(
                              Icons.tag_rounded,
                              color: Colors.white60,
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(color: Colors.white60)),
                            errorBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(color: Colors.red)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(color: Colors.purple)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 0),
                        child: Row(
                          children: [
                            Checkbox(
                              checkColor: Colors.white,
                              value: isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              },
                            ),
                            Text(
                              "SAVE FOR FURTHER USE",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    side: BorderSide(color: Colors.green))),
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.green),
                            foregroundColor:
                                MaterialStatePropertyAll(Colors.white),
                          ),
                          onPressed: () {},
                          child: SizedBox(
                            width: 130,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("JOIN NOW ("),
                                LottieBuilder.asset(
                                  "Assets/coin.json",
                                  animate: false,
                                ),
                                Text(
                                  widget.entryFee.toString(),
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 255, 234, 45)),
                                ),
                                Text(")")
                              ],
                            ),
                          ))
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "*PLEASE ENTER YOUR BGMI ID SAME AS YOUR OWN ACCOUNT OTHERWISE YOU ARE NOT ALLOWED TO PLAY",
                  style: TextStyle(color: Colors.red, fontSize: 20),
                ),
              ),
            ],
          )),
    );
  }
}
