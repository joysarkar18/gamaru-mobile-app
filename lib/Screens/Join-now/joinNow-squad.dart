import 'package:flutter/material.dart';
import 'package:gamaru_mobile_app/Componants/glossyEffect.dart';
import 'package:gamaru_mobile_app/Controllers/Event-controller/eventController.dart';
import 'package:gamaru_mobile_app/game_screen.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

bool isChecked = false;

class JoinNowSquad extends StatefulWidget {
  final String eventName;
  final int entryFee;
  final int index;
  final DateTime dt;
  const JoinNowSquad(
      {super.key,
      required this.entryFee,
      required this.index,
      required this.dt,
      required this.eventName});

  @override
  State<JoinNowSquad> createState() => _JoinNowSquadState();
}

class _JoinNowSquadState extends State<JoinNowSquad> {
  final eventController = Get.put(EventController());
  final fromKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    eventController.getBgmiId();
  }

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
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
                height: Get.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 200,
                      child: Center(
                        child: LottieBuilder.asset(
                          "Assets/squad.json",
                          frameRate: FrameRate.max,
                        ),
                      ),
                    ),
                    GlossyCard(
                      height: Get.height * .53,
                      width: Get.width - 30.0,
                      borderRadius: 10.0,
                      borderWith: 2.0,
                      child: Form(
                        key: fromKey,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, top: 20, bottom: 0),
                              child: TextFormField(
                                validator: (value) => validateID(value),
                                controller: eventController.player1,
                                keyboardType: TextInputType.text,
                                style: const TextStyle(
                                    color: Colors.white60,
                                    decoration: TextDecoration.none),
                                decoration: const InputDecoration(
                                  fillColor: Colors.transparent,
                                  hintText: "ENTER PLAYER-1 GAME ID NAME",
                                  hintStyle: TextStyle(
                                      color: Colors.white60, fontSize: 15),
                                  prefixIcon: Icon(
                                    Icons.tag_rounded,
                                    color: Colors.white60,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      borderSide:
                                          BorderSide(color: Colors.white60)),
                                  errorBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      borderSide:
                                          BorderSide(color: Colors.red)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      borderSide:
                                          BorderSide(color: Colors.purple)),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, top: 20, bottom: 0),
                              child: TextFormField(
                                validator: (value) => validateID(value),
                                controller: eventController.player2,
                                keyboardType: TextInputType.text,
                                style: const TextStyle(
                                    color: Colors.white60,
                                    decoration: TextDecoration.none),
                                decoration: const InputDecoration(
                                  fillColor: Colors.transparent,
                                  hintText: "ENTER PLAYER-2 GAME ID NAME",
                                  hintStyle: TextStyle(
                                      color: Colors.white60, fontSize: 15),
                                  prefixIcon: Icon(
                                    Icons.tag_rounded,
                                    color: Colors.white60,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      borderSide:
                                          BorderSide(color: Colors.white60)),
                                  errorBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      borderSide:
                                          BorderSide(color: Colors.red)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      borderSide:
                                          BorderSide(color: Colors.purple)),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, top: 20, bottom: 0),
                              child: TextFormField(
                                validator: (value) => validateID(value),
                                controller: eventController.player3,
                                keyboardType: TextInputType.text,
                                style: const TextStyle(
                                    color: Colors.white60,
                                    decoration: TextDecoration.none),
                                decoration: const InputDecoration(
                                  fillColor: Colors.transparent,
                                  hintText: "ENTER PLAYER-3 GAME ID NAME",
                                  hintStyle: TextStyle(
                                      color: Colors.white60, fontSize: 15),
                                  prefixIcon: Icon(
                                    Icons.tag_rounded,
                                    color: Colors.white60,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      borderSide:
                                          BorderSide(color: Colors.white60)),
                                  errorBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      borderSide:
                                          BorderSide(color: Colors.red)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      borderSide:
                                          BorderSide(color: Colors.purple)),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, top: 20, bottom: 0),
                              child: TextFormField(
                                validator: (value) => validateID(value),
                                controller: eventController.player4,
                                keyboardType: TextInputType.text,
                                style: const TextStyle(
                                    color: Colors.white60,
                                    decoration: TextDecoration.none),
                                decoration: const InputDecoration(
                                  fillColor: Colors.transparent,
                                  hintText: "ENTER PLAYER-4 GAME ID NAME",
                                  hintStyle: TextStyle(
                                      color: Colors.white60, fontSize: 15),
                                  prefixIcon: Icon(
                                    Icons.tag_rounded,
                                    color: Colors.white60,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      borderSide:
                                          BorderSide(color: Colors.white60)),
                                  errorBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      borderSide:
                                          BorderSide(color: Colors.red)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      borderSide:
                                          BorderSide(color: Colors.purple)),
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
                                  const Text(
                                    "SAVE FOR FURTHER USE",
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            ElevatedButton(
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          side:
                                              BorderSide(color: Colors.green))),
                                  backgroundColor:
                                      MaterialStatePropertyAll(Colors.green),
                                  foregroundColor:
                                      MaterialStatePropertyAll(Colors.white),
                                ),
                                onPressed: () {
                                  final from = fromKey.currentState!;
                                  if (from.validate()) {
                                    if (isChecked) {
                                      eventController.updateBgmiId(
                                          eventController.player1.text,
                                          eventController.player2.text,
                                          eventController.player3.text,
                                          eventController.player4.text);
                                    }

                                    if (widget.eventName.contains("BGMI")) {
                                      eventController.joinBgmi(
                                          widget.index,
                                          widget.dt,
                                          widget.entryFee,
                                          "squad",
                                          eventController.player1.text,
                                          eventController.player2.text,
                                          eventController.player3.text,
                                          eventController.player4.text);
                                    } else if (widget.eventName
                                        .contains("FREE FIRE")) {
                                      eventController.joinFreeFire(
                                          widget.index,
                                          widget.dt,
                                          widget.entryFee,
                                          "squad",
                                          eventController.player1.text,
                                          eventController.player2.text,
                                          eventController.player3.text,
                                          eventController.player4.text);
                                    }
                                  }
                                },
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
                                            color: Color.fromARGB(
                                                255, 255, 234, 45)),
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
                        "*PLEASE ENTER GAME ID SAME AS YOUR GAME ACCOUNT OTHERWISE YOU ARE NOT ALLOWED TO PLAY",
                        style: TextStyle(color: Colors.orange, fontSize: 20),
                      ),
                    ),
                  ],
                )),
            Obx(
              () => eventController.is_joining.value
                  ? Container(
                      color: const Color.fromARGB(39, 158, 158, 158),
                      height: Get.height,
                      width: Get.width,
                      child: const Center(
                          child: SizedBox(
                        height: 80,
                        width: 80,
                        child: CircularProgressIndicator(),
                      )),
                    )
                  : const Text(""),
            ),
          ],
        ),
      ),
    );
  }
}

String? validateID(String? id) {
  if (id == null || id.isEmpty) {
    return "please enter the ID";
  }

  return null;
}
