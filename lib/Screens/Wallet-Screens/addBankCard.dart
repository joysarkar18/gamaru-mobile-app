import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddBankCard extends StatelessWidget {
  const AddBankCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Colors.black,
          title: Text(
            "BANK CARDS",
            style: TextStyle(color: Colors.white),
          )),
      body: Center(
          child: Column(
        children: [
          Container(
            height: Get.height * 0.5,
          ),
          Icon(
            Icons.add_box_rounded,
            color: Colors.white,
            size: 50,
          ),
          Text(
            "ADD NEW BANK CARD",
            style: TextStyle(color: Colors.white),
          ),
        ],
      )),
    );
  }
}
