import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gamaru_mobile_app/Controllers/Main-Controller/mainController.dart';
import 'package:gamaru_mobile_app/Screens/result-screen/result_card.dart';
import 'package:get/get.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  MainController mainController = Get.put(MainController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mainController.loadAllResult();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
          color: Colors.black,
          width: Get.width,
          padding: EdgeInsets.only(top: 20, left: 10, right: 10),
          child: Obx(
            () => SizedBox(
              height: Get.height,
              child: ListView(
                children: mainController.allResults.value.map((e) {
                  Timestamp t = e["time"];
                  DateTime dt = t.toDate();
                  List names = e["names"];
                  List prize = e["prize"];
                  String eventName = e["eventName"];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: ResultCard(
                        date: dt,
                        eventName: eventName,
                        name1: names[0],
                        name2: names[1],
                        name3: names[2],
                        prize1: prize[0].toString(),
                        prize2: prize[1].toString(),
                        prize3: prize[2].toString()),
                  );
                }).toList(),
              ),
            ),
          )),
    );
  }
}
