import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gamaru_mobile_app/Controllers/Event-controller/bgmiController.dart';
import 'package:gamaru_mobile_app/Controllers/User-Controller/userController.dart';
import 'package:gamaru_mobile_app/Screens/Game-Screen/event.dart';
import 'package:get/get.dart';

class GameScreen extends StatefulWidget {
  final gameName;
  const GameScreen({super.key, required this.gameName});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final userController = Get.put(UserController());
  final bgmiController = Get.put(BgmiController());
  @override
  void initState() {
    super.initState();
    bgmiController.getUpcoming();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: DefaultTabController(
        length: 3,
        initialIndex: 1,
        child: Scaffold(
            extendBodyBehindAppBar: false,
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: Text(
                widget.gameName,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              leading: BackButton(
                color: Colors.white,
              ),

              centerTitle: true,
              titleSpacing: 5,
              // elevation: 20,
              bottom: TabBar(
                  indicatorColor: Colors.purple,
                  indicatorWeight: 3,
                  tabs: [
                    // FOR CURRENT SCREEN

                    Tab(
                      // text: "Current Event",
                      child: Text(
                        "Current",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),

                    // FOR UPCOMMING SCREEN

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
              physics: BouncingScrollPhysics(),
              dragStartBehavior: DragStartBehavior.down,
              children: [
                // FOR CURRENT PAGE
                Container(
                    color: Colors.black,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        EventCard(),
                      ],
                    )),

                // FOR UPCOMMING PAGE

                Obx(
                  () => bgmiController.upcoming_loading.value
                      ? Container(
                          color: Colors.black,
                          child:
                              const Center(child: CircularProgressIndicator()))
                      : Container(
                          color: Colors.black,
                          child: ListView.builder(
                            itemCount: bgmiController
                                .eventListBgmiUpcoming.value.length,
                            itemBuilder: (context, index) {
                              return EventCard();
                            },
                          ),
                        ),
                ),

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
                    title: Text(
                      "Name of player",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    subtitle: Text(
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(0.0),
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
