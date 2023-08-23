import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "TRANSACTIONS",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
          height: Get.height,
          width: Get.width,
          child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("user transactions")
                .doc(FirebaseAuth.instance.currentUser!.email.toString())
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List l = snapshot.data!.data()!["transactions"];
                if (l.isEmpty) {
                  return Center(
                    child: Text("NO DATA"),
                  );
                } else {
                  return Center(
                    child: Text("kjhadskaj DATA"),
                  );
                }
              } else {
                return CircularProgressIndicator();
              }
            },
          )),
    );
  }
}
