import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          extendBodyBehindAppBar: false,
          appBar: AppBar(
            backgroundColor: Colors.black,
            leading: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.menu,
                  color: Colors.white,
                )),
            title: Text(
              "G A M A R U",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
            ),
            actions: [
              Icon(
                Icons.notifications,
                color: Colors.white,
              )
            ],
            centerTitle: true,
            titleSpacing: 5,
            // elevation: 20,
            bottom: TabBar(
                indicatorColor: Colors.purple,
                indicatorWeight: 3,
                tabs: [
                  Tab(
                    // text: "Current Event",
                    child: Text(
                      "Current Event",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Tab(
                    // text: "Upcomming Event",
                    child: Text(
                      "Upcomming Event",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ]),
          ),
          body: TabBarView(
            physics: BouncingScrollPhysics(),
            dragStartBehavior: DragStartBehavior.down,
            children: [
              Container(
                color: Colors.black,
                child: Center(
                  child: Text(
                    "Current",
                    style: TextStyle(color: Colors.white, fontSize: 35),
                  ),
                ),
              ),
              Container(
                color: Colors.black,
                child: Center(
                  child: Text(
                    "Upcomming",
                    style: TextStyle(color: Colors.white, fontSize: 35),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
