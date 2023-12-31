import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gamaru_mobile_app/Screens/Wallet-Screens/addMoney.dart';
import 'package:get/get.dart';

class EventController extends GetxController {
  static EventController get instance => Get.find();
  final _db = FirebaseFirestore.instance;
  List eventListBgmiUpcoming = [];
  // ignore: non_constant_identifier_names
  RxBool upcoming_loading = true.obs;

  TextEditingController player1 = TextEditingController();
  TextEditingController player2 = TextEditingController();
  TextEditingController player3 = TextEditingController();
  TextEditingController player4 = TextEditingController();
  // ignore: non_constant_identifier_names
  RxBool is_joining = false.obs;

  upadteTransaction(int fee) async {
    await _db
        .collection("user transactions")
        .doc(FirebaseAuth.instance.currentUser!.email)
        .get()
        .then((value) async {
      List tList = value["transactions"];
      tList.insert(0, {
        "amount": fee,
        "email": FirebaseAuth.instance.currentUser!.email,
        "fee": 0,
        "reason": "Joined Contest",
        "time": DateTime.now(),
        "add": false,
      });

      await _db
          .collection("user transactions")
          .doc(FirebaseAuth.instance.currentUser!.email)
          .update({"transactions": tList}).then((value) {
        is_joining.value = false;
        Get.back();
      });
    });
  }

  Future<void> joinBgmi(int index, DateTime dt, int fee, String matchType,
      String player1, String player2, String player3, String player4) async {
    is_joining.value = true;
    if (matchType == "solo") {
      await _db
          .collection("user")
          .doc(FirebaseAuth.instance.currentUser!.email.toString())
          .get()
          .then((value) async {
        int bal = value["coins"];
        if (bal < fee) {
          Timer(const Duration(seconds: 0), () {
            Get.snackbar(onTap: (snack) {
              Get.off(const AddMoney());
            }, "Low Balance", "Doesn't have sufficient balance",
                colorText: Colors.red);
            is_joining.value = false;
            return;
          });
        } else {
          bal = bal - fee;

          await _db
              .collection("user")
              .doc(FirebaseAuth.instance.currentUser!.email)
              .update({"coins": bal});

          await _db
              .collection("BATTLE GROUNDS MOBILE INDIA")
              .doc("upcoming")
              .get()
              .then((value) async {
            eventListBgmiUpcoming = value["event"];
            List temp = eventListBgmiUpcoming[index]["eventRegisteredPlayers"];
            temp.add(FirebaseAuth.instance.currentUser!.email.toString());
            eventListBgmiUpcoming[index]["eventRegisteredPlayers"] = temp;
            await _db
                .collection("BATTLE GROUNDS MOBILE INDIA")
                .doc("upcoming")
                .update({"event": eventListBgmiUpcoming}).then((_) async {
              await _db
                  .collection("BGMI REGISTER LIST")
                  .doc(dt.day.toString() +
                      dt.month.toString() +
                      dt.year.toString() +
                      dt.hour.toString() +
                      dt.minute.toString() +
                      matchType)
                  .get()
                  .then((value) async {
                if (value.exists) {
                  List l = value["players"];
                  l.add({
                    "player1": player1,
                    "email":
                        FirebaseAuth.instance.currentUser!.email.toString(),
                    "paid": false
                  });
                  await _db
                      .collection("BGMI REGISTER LIST")
                      .doc(dt.day.toString() +
                          dt.month.toString() +
                          dt.year.toString() +
                          dt.hour.toString() +
                          dt.minute.toString() +
                          matchType)
                      .update({"players": l}).then((value) async {
                    upadteTransaction(fee);
                  });
                } else {
                  List l = [];
                  l.add({
                    "player1": player1,
                    "email":
                        FirebaseAuth.instance.currentUser!.email.toString(),
                    "paid": false
                  });
                  await _db
                      .collection("BGMI REGISTER LIST")
                      .doc(dt.day.toString() +
                          dt.month.toString() +
                          dt.year.toString() +
                          dt.hour.toString() +
                          dt.minute.toString() +
                          matchType)
                      .set({"players": l}).then((value) async {
                    upadteTransaction(fee);
                  });
                }
              });
            });
          });
        }
      });
    }

    if (matchType == "duo") {
      await _db
          .collection("user")
          .doc(FirebaseAuth.instance.currentUser!.email.toString())
          .get()
          .then((value) async {
        int bal = value["coins"];
        if (bal < fee) {
          Timer(const Duration(seconds: 0), () {
            Get.snackbar(onTap: (snack) {
              Get.off(AddMoney());
            }, "Low Balance", "Doesn't have sufficient balance",
                colorText: Colors.red);
            is_joining.value = false;
            return;
          });
        } else {
          bal = bal - fee;

          await _db
              .collection("user")
              .doc(FirebaseAuth.instance.currentUser!.email)
              .update({"coins": bal});

          await _db
              .collection("BATTLE GROUNDS MOBILE INDIA")
              .doc("upcoming")
              .get()
              .then((value) async {
            eventListBgmiUpcoming = value["event"];
            List temp = eventListBgmiUpcoming[index]["eventRegisteredPlayers"];
            temp.add(FirebaseAuth.instance.currentUser!.email.toString());
            eventListBgmiUpcoming[index]["eventRegisteredPlayers"] = temp;
            await _db
                .collection("BATTLE GROUNDS MOBILE INDIA")
                .doc("upcoming")
                .update({"event": eventListBgmiUpcoming}).then((_) async {
              await _db
                  .collection("BGMI REGISTER LIST")
                  .doc(dt.day.toString() +
                      dt.month.toString() +
                      dt.year.toString() +
                      dt.hour.toString() +
                      dt.minute.toString() +
                      matchType)
                  .get()
                  .then((value) async {
                if (value.exists) {
                  List l = value["players"];
                  l.add({
                    "player1": player1,
                    "player2": player2,
                    "email":
                        FirebaseAuth.instance.currentUser!.email.toString(),
                    "paid": false
                  });
                  await _db
                      .collection("BGMI REGISTER LIST")
                      .doc(dt.day.toString() +
                          dt.month.toString() +
                          dt.year.toString() +
                          dt.hour.toString() +
                          dt.minute.toString() +
                          matchType)
                      .update({"players": l}).then((value) {
                    upadteTransaction(fee);
                  });
                } else {
                  List l = [];
                  l.add({
                    "player1": player1,
                    "player2": player2,
                    "email":
                        FirebaseAuth.instance.currentUser!.email.toString(),
                    "paid": false
                  });
                  await _db
                      .collection("BGMI REGISTER LIST")
                      .doc(dt.day.toString() +
                          dt.month.toString() +
                          dt.year.toString() +
                          dt.hour.toString() +
                          dt.minute.toString() +
                          matchType)
                      .set({"players": l}).then((value) async {
                    upadteTransaction(fee);
                  });
                }
              });
            });
          });
        }
      });
    }

    if (matchType == "squad") {
      await _db
          .collection("user")
          .doc(FirebaseAuth.instance.currentUser!.email.toString())
          .get()
          .then((value) async {
        int bal = value["coins"];
        if (bal < fee) {
          Timer(const Duration(seconds: 0), () {
            Get.snackbar(onTap: (snack) {
              Get.off(AddMoney());
            }, "Low Balance", "Doesn't have sufficient balance",
                colorText: Colors.red);
            is_joining.value = false;
            return;
          });
        } else {
          bal = bal - fee;

          await _db
              .collection("user")
              .doc(FirebaseAuth.instance.currentUser!.email)
              .update({"coins": bal});

          await _db
              .collection("BATTLE GROUNDS MOBILE INDIA")
              .doc("upcoming")
              .get()
              .then((value) async {
            eventListBgmiUpcoming = value["event"];
            List temp = eventListBgmiUpcoming[index]["eventRegisteredPlayers"];
            temp.add(FirebaseAuth.instance.currentUser!.email.toString());
            eventListBgmiUpcoming[index]["eventRegisteredPlayers"] = temp;
            await _db
                .collection("BATTLE GROUNDS MOBILE INDIA")
                .doc("upcoming")
                .update({"event": eventListBgmiUpcoming}).then((_) async {
              await _db
                  .collection("BGMI REGISTER LIST")
                  .doc(dt.day.toString() +
                      dt.month.toString() +
                      dt.year.toString() +
                      dt.hour.toString() +
                      dt.minute.toString() +
                      matchType)
                  .get()
                  .then((value) async {
                if (value.exists) {
                  List l = value["players"];
                  l.add({
                    "player1": player1,
                    "player2": player2,
                    "player3": player3,
                    "player4": player4,
                    "email":
                        FirebaseAuth.instance.currentUser!.email.toString(),
                    "paid": false
                  });
                  await _db
                      .collection("BGMI REGISTER LIST")
                      .doc(dt.day.toString() +
                          dt.month.toString() +
                          dt.year.toString() +
                          dt.hour.toString() +
                          dt.minute.toString() +
                          matchType)
                      .update({"players": l}).then((value) {
                    upadteTransaction(fee);
                  });
                } else {
                  List l = [];
                  l.add({
                    "player1": player1,
                    "player2": player2,
                    "player3": player3,
                    "player4": player4,
                    "email":
                        FirebaseAuth.instance.currentUser!.email.toString(),
                    "paid": false
                  });
                  await _db
                      .collection("BGMI REGISTER LIST")
                      .doc(dt.day.toString() +
                          dt.month.toString() +
                          dt.year.toString() +
                          dt.hour.toString() +
                          dt.minute.toString() +
                          matchType)
                      .set({"players": l}).then((value) async {
                    upadteTransaction(fee);
                  });
                }
              });
            });
          });
        }
      });
    }
  }

  getBgmiId() async {
    _db
        .collection("user")
        .doc(FirebaseAuth.instance.currentUser!.email.toString())
        .get()
        .then((value) {
      player1.text = value["bgmiId"];
      player2.text = value["player2"];
      player3.text = value["player3"];
      player4.text = value["player4"];
    });
  }

  updateBgmiId(
      String id, String player2, String player3, String player4) async {
    _db
        .collection("user")
        .doc(FirebaseAuth.instance.currentUser!.email.toString())
        .update({
      "bgmiId": id,
      "player2": player2,
      "player3": player3,
      "player4": player4
    });
  }

  Future<void> joinFreeFire(int index, DateTime dt, int fee, String matchType,
      String player1, String player2, String player3, String player4) async {
    is_joining.value = true;
    if (matchType == "solo") {
      await _db
          .collection("user")
          .doc(FirebaseAuth.instance.currentUser!.email.toString())
          .get()
          .then((value) async {
        int bal = value["coins"];
        if (bal < fee) {
          Timer(const Duration(seconds: 0), () {
            Get.snackbar(onTap: (snack) {
              Get.off(AddMoney());
            }, "Low Balance", "Doesn't have sufficient balance",
                colorText: Colors.red);
            is_joining.value = false;
            return;
          });
        } else {
          bal = bal - fee;

          await _db
              .collection("user")
              .doc(FirebaseAuth.instance.currentUser!.email)
              .update({"coins": bal});

          await _db
              .collection("FREE FIRE")
              .doc("upcoming")
              .get()
              .then((value) async {
            eventListBgmiUpcoming = value["event"];
            List temp = eventListBgmiUpcoming[index]["eventRegisteredPlayers"];
            temp.add(FirebaseAuth.instance.currentUser!.email.toString());
            eventListBgmiUpcoming[index]["eventRegisteredPlayers"] = temp;
            await _db
                .collection("FREE FIRE")
                .doc("upcoming")
                .update({"event": eventListBgmiUpcoming}).then((_) async {
              await _db
                  .collection("FREE FIRE REGISTER LIST")
                  .doc(dt.day.toString() +
                      dt.month.toString() +
                      dt.year.toString() +
                      dt.hour.toString() +
                      dt.minute.toString() +
                      matchType)
                  .get()
                  .then((value) async {
                if (value.exists) {
                  List l = value["players"];
                  l.add({
                    "player1": player1,
                    "email":
                        FirebaseAuth.instance.currentUser!.email.toString(),
                    "paid": false
                  });
                  await _db
                      .collection("FREE FIRE REGISTER LIST")
                      .doc(dt.day.toString() +
                          dt.month.toString() +
                          dt.year.toString() +
                          dt.hour.toString() +
                          dt.minute.toString() +
                          matchType)
                      .update({"players": l}).then((value) {
                    upadteTransaction(fee);
                  });
                } else {
                  List l = [];
                  l.add({
                    "player1": player1,
                    "email":
                        FirebaseAuth.instance.currentUser!.email.toString(),
                    "paid": false
                  });
                  await _db
                      .collection("FREE FIRE REGISTER LIST")
                      .doc(dt.day.toString() +
                          dt.month.toString() +
                          dt.year.toString() +
                          dt.hour.toString() +
                          dt.minute.toString() +
                          matchType)
                      .set({"players": l}).then((value) async {
                    upadteTransaction(fee);
                  });
                }
              });
            });
          });
        }
      });
    }

    if (matchType == "duo") {
      await _db
          .collection("user")
          .doc(FirebaseAuth.instance.currentUser!.email.toString())
          .get()
          .then((value) async {
        int bal = value["coins"];
        if (bal < fee) {
          Timer(const Duration(seconds: 0), () {
            Get.snackbar(onTap: (snack) {
              Get.off(AddMoney());
            }, "Low Balance", "Doesn't have sufficient balance",
                colorText: Colors.red);
            is_joining.value = false;
            return;
          });
        } else {
          bal = bal - fee;

          await _db
              .collection("user")
              .doc(FirebaseAuth.instance.currentUser!.email)
              .update({"coins": bal});

          await _db
              .collection("FREE FIRE")
              .doc("upcoming")
              .get()
              .then((value) async {
            eventListBgmiUpcoming = value["event"];
            List temp = eventListBgmiUpcoming[index]["eventRegisteredPlayers"];
            temp.add(FirebaseAuth.instance.currentUser!.email.toString());
            eventListBgmiUpcoming[index]["eventRegisteredPlayers"] = temp;
            await _db
                .collection("FREE FIRE")
                .doc("upcoming")
                .update({"event": eventListBgmiUpcoming}).then((_) async {
              await _db
                  .collection("FREE FIRE REGISTER LIST")
                  .doc(dt.toString())
                  .get()
                  .then((value) async {
                if (value.exists) {
                  List l = value["players"];
                  l.add({
                    "player1": player1,
                    "player2": player2,
                    "email":
                        FirebaseAuth.instance.currentUser!.email.toString(),
                    "paid": false
                  });
                  await _db
                      .collection("FREE FIRE REGISTER LIST")
                      .doc(dt.day.toString() +
                          dt.month.toString() +
                          dt.year.toString() +
                          dt.hour.toString() +
                          dt.minute.toString() +
                          matchType)
                      .update({"players": l}).then((value) {
                    upadteTransaction(fee);
                  });
                } else {
                  List l = [];
                  l.add({
                    "player1": player1,
                    "player2": player2,
                    "email":
                        FirebaseAuth.instance.currentUser!.email.toString(),
                    "paid": false
                  });
                  await _db
                      .collection("FREE FIRE REGISTER LIST")
                      .doc(dt.day.toString() +
                          dt.month.toString() +
                          dt.year.toString() +
                          dt.hour.toString() +
                          dt.minute.toString() +
                          matchType)
                      .set({"players": l}).then((value) async {
                    upadteTransaction(fee);
                  });
                }
              });
            });
          });
        }
      });
    }

    if (matchType == "squad") {
      await _db
          .collection("user")
          .doc(FirebaseAuth.instance.currentUser!.email.toString())
          .get()
          .then((value) async {
        int bal = value["coins"];
        if (bal < fee) {
          Timer(const Duration(seconds: 0), () {
            Get.snackbar(onTap: (snack) {
              Get.off(AddMoney());
            }, "Low Balance", "Doesn't have sufficient balance",
                colorText: Colors.red);
            is_joining.value = false;
            return;
          });
        } else {
          bal = bal - fee;

          await _db
              .collection("user")
              .doc(FirebaseAuth.instance.currentUser!.email)
              .update({"coins": bal});

          await _db
              .collection("FREE FIRE")
              .doc("upcoming")
              .get()
              .then((value) async {
            eventListBgmiUpcoming = value["event"];
            List temp = eventListBgmiUpcoming[index]["eventRegisteredPlayers"];
            temp.add(FirebaseAuth.instance.currentUser!.email.toString());
            eventListBgmiUpcoming[index]["eventRegisteredPlayers"] = temp;
            await _db
                .collection("FREE FIRE")
                .doc("upcoming")
                .update({"event": eventListBgmiUpcoming}).then((_) async {
              await _db
                  .collection("FREE FIRE REGISTER LIST")
                  .doc(dt.toString())
                  .get()
                  .then((value) async {
                if (value.exists) {
                  List l = value["players"];
                  l.add({
                    "player1": player1,
                    "player2": player2,
                    "player3": player3,
                    "player4": player4,
                    "email":
                        FirebaseAuth.instance.currentUser!.email.toString(),
                    "paid": false
                  });
                  await _db
                      .collection("FREE FIRE REGISTER LIST")
                      .doc(dt.day.toString() +
                          dt.month.toString() +
                          dt.year.toString() +
                          dt.hour.toString() +
                          dt.minute.toString() +
                          matchType)
                      .update({"players": l}).then((value) {
                    upadteTransaction(fee);
                  });
                } else {
                  List l = [];
                  l.add({
                    "player1": player1,
                    "player2": player2,
                    "player3": player3,
                    "player4": player4,
                    "email":
                        FirebaseAuth.instance.currentUser!.email.toString(),
                    "paid": false
                  });
                  await _db
                      .collection("FREE FIRE REGISTER LIST")
                      .doc(dt.day.toString() +
                          dt.month.toString() +
                          dt.year.toString() +
                          dt.hour.toString() +
                          dt.minute.toString() +
                          matchType)
                      .set({"players": l}).then((value) async {
                    upadteTransaction(fee);
                  });
                }
              });
            });
          });
        }
      });
    }
  }
}
