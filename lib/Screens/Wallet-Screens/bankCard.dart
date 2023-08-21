import 'package:flutter/material.dart';
import 'package:gamaru_mobile_app/Screens/Wallet-Screens/addBankCard.dart';
import 'package:get/get.dart';

class BankCard extends StatelessWidget {
  const BankCard({super.key});

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
          InkWell(
            onTap: () {
              Get.to(() => AddBankCard());
            },
            child: Icon(
              Icons.add_box_rounded,
              color: Colors.white,
              size: 50,
            ),
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
