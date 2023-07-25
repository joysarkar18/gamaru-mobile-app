import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  int _currentIndex = 0;
  List _pages = [
    CurrentPage(),
    UpcommingPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: Get.height * .05,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        const Color.fromARGB(255, 7, 66, 113),
                        Colors.purple
                      ]),
                  shape: BoxShape.rectangle),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "GAMARU",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    width: Get.width * .57,
                  ),
                  Icon(
                    Icons.currency_rupee,
                    color: Colors.white,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        // backgroundBlendMode: BlendMode.colorDodge,
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 31, 9, 120)
                                .withOpacity(0.79),
                            blurRadius: 25.0,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(7),
                        color: Colors.amber),
                    child: TextButton(
                      onPressed: () {
                        Get.to(_pages[_currentIndex]);
                        currentIndex =_currentIndex,

                      },
                      child: Text(
                        "Current Event",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 31, 9, 120)
                                .withOpacity(0.79),
                            blurRadius: 25.0,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(7),
                        color: Colors.amber),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Upcomming Event",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class UpcommingPage {}

class CurrentPage {}
