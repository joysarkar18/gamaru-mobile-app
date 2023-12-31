import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gamaru_mobile_app/Componants/glossyEffect.dart';
import 'package:gamaru_mobile_app/Controllers/Event-controller/eventController.dart';
import 'package:gamaru_mobile_app/Controllers/User-Controller/userController.dart';
import 'package:gamaru_mobile_app/Screens/Game-Screen/event.dart';
import 'package:gamaru_mobile_app/Screens/result-screen/result_card.dart';
import 'package:gamaru_mobile_app/Screens/result-screen/result_screen.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:lottie/lottie.dart';

class GameScreen extends StatefulWidget {
  final gameName;
  const GameScreen({super.key, required this.gameName});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final userController = Get.put(UserController());

  Future<void> _handleRequest() async {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Scaffold(
            backgroundColor: Colors.black,
            extendBodyBehindAppBar: false,
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: Text(
                widget.gameName,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              leading: const BackButton(
                color: Colors.white,
              ),

              centerTitle: true,
              titleSpacing: 5,
              // elevation: 20,
              bottom: const TabBar(
                  indicatorColor: Colors.purple,
                  indicatorWeight: 3,
                  tabs: [
                    Tab(
                      // text: "Upcomming Event",
                      child: Text(
                        "Upcomming",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Result",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ]),
            ),
            body: widget.gameName == "LUDO" || widget.gameName == "CARROM"
                ? Container(
                    color: Colors.black,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LottieBuilder.asset("Assets/NoData.json"),
                        Text(
                          "Comming Soon",
                          style: TextStyle(color: Colors.white70, fontSize: 20),
                        )
                      ],
                    ),
                  )
                : TabBarView(
                    physics: const BouncingScrollPhysics(),
                    dragStartBehavior: DragStartBehavior.down,
                    children: [
                      Container(
                          color: Colors.black,
                          child: StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection(widget.gameName.toString())
                                .doc("upcoming")
                                .snapshots(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                List arr = snapshot.data!.data()!["event"];
                                return LiquidPullToRefresh(
                                  color: const Color.fromARGB(255, 37, 72, 101),
                                  animSpeedFactor: 3,
                                  springAnimationDurationInMilliseconds: 600,
                                  onRefresh: _handleRequest,
                                  backgroundColor:
                                      Color.fromARGB(255, 220, 19, 255),
                                  child: ListView.builder(
                                    itemCount: arr.length,
                                    itemBuilder: (context, index) {
                                      var l = arr[index];
                                      Timestamp t = l["eventTime"];
                                      DateTime dt = t.toDate();
                                      List rList = l["eventRegisteredPlayers"];

                                      return EventCard(
                                        index: index,
                                        registerList: rList,
                                        eventEntryFee: l["eventEntryFee"],
                                        eventMap: l["eventMap"],
                                        eventName: l["eventName"],
                                        eventPerKill: l["eventPerKill"],
                                        eventRegisteredPlayers: rList.length,
                                        eventTime: dt,
                                        eventTotalPlayers:
                                            l["eventTotalPlayers"],
                                        eventWinner: l["eventWinner"],
                                        id: l["id"],
                                        pass: l["pass"],
                                      );
                                    },
                                  ),
                                );
                              } else {
                                return const Center(
                                  child: SizedBox(
                                      height: 50,
                                      width: 50,
                                      child: CircularProgressIndicator(
                                        backgroundColor: Colors.grey,
                                      )),
                                );
                              }
                            },
                          )),

                      // FOR RESULT PAGE
                      const ResultScreen(),
                    ],
                  )),
      ),
    );
  }
}
