import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gamaru_mobile_app/Controllers/Event-controller/bgmiController.dart';
import 'package:gamaru_mobile_app/Controllers/User-Controller/userController.dart';
import 'package:gamaru_mobile_app/Screens/Game-Screen/event.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class GameScreen extends StatefulWidget {
  final gameName;
  const GameScreen({super.key, required this.gameName});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final userController = Get.put(UserController());
  final bgmiController = Get.put(BgmiController());

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
            extendBodyBehindAppBar: false,
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: Text(
                widget.gameName,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
              leading: const BackButton(
                color: Colors.white,
              ),

              centerTitle: true,
              titleSpacing: 5,
              // elevation: 20,
              bottom: const TabBar(
                  indicatorColor: Colors.purple,
                  indicatorWeight: 2,
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
            body: TabBarView(
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
                          List arr = snapshot.data!.data()!["events"];
                          return LiquidPullToRefresh(
                            color: const Color.fromARGB(255, 37, 72, 101),
                            animSpeedFactor: 5,
                            onRefresh: _handleRequest,
                            backgroundColor: Color.fromARGB(255, 220, 19, 255),
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
                                  eventTotalPlayers: l["eventTotalPlayers"],
                                  eventWinner: l["eventWinner"],
                                );
                              },
                            ),
                          );
                        } else {
                          return const SizedBox(
                              height: 100,
                              width: 100,
                              child: CircularProgressIndicator());
                        }
                      },
                    )),

                // FOR RESULT PAGE

                Container(
                  color: Colors.black,
                  child: ListTile(
                    onTap: () {
                      print("fuck u");
                    },
                    focusColor: Colors.amber,
                    // horizontalTitleGap: 10,
                    hoverColor: Colors.amber,
                    title: const Text(
                      "Name of player",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    subtitle: const Text(
                      "Name of event",
                      style: TextStyle(color: Colors.purple, fontSize: 15),
                    ),
                    leading: CircleAvatar(radius: 25),
                    trailing: Container(
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Color.fromARGB(255, 78, 78, 78).withOpacity(0.9),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(0.0),
                            child: Icon(
                              Icons.currency_rupee,
                              color: Colors.green,
                            ),
                          ),
                          Text(
                            "100",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
