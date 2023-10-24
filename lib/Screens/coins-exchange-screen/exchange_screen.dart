import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gamaru_mobile_app/Controllers/Main-Controller/mainController.dart';
import 'package:gamaru_mobile_app/Controllers/Wallet-Controller/walletController.dart';
import 'package:gamaru_mobile_app/Screens/Customer%20Support/SupportScreen.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
// import 'package:razorpay_flutter/razorpay_flutter.dart';

class ExchangeScreen extends StatefulWidget {
  const ExchangeScreen({super.key});

  @override
  State<ExchangeScreen> createState() => _ExchangeScreenState();
}

class _ExchangeScreenState extends State<ExchangeScreen> {
  int balance = 0;
  // final _razorpay = Razorpay();
  final fromKey = GlobalKey<FormState>();
  MainController mainController = Get.put(MainController());

  int winCoins = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
        appBar: AppBar(
            backgroundColor: Colors.black,
            iconTheme: const IconThemeData(color: Colors.white),
            title: const Text(
              "EXCHANGE",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            )),
        body: SizedBox(
          width: Get.width,
          child: Column(children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 48,
              width: 270,
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 78, 78, 78).withOpacity(0.9),
                  borderRadius: BorderRadius.circular(15)),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Play Coins - ",
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                    LottieBuilder.asset(
                      "Assets/coin.json",
                      height: 30,
                      width: 20,
                      frameRate: FrameRate.max,
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection("user")
                          .doc(FirebaseAuth.instance.currentUser!.email
                              .toString())
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          int coins = snapshot!.data!.data()!["coins"];
                          return Text(
                            coins.toString(),
                            style: const TextStyle(
                                color: Colors.yellow, fontSize: 20),
                          );
                        } else {
                          return const Text("0");
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              height: 48,
              width: 270,
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 78, 78, 78).withOpacity(0.9),
                  borderRadius: BorderRadius.circular(15)),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Win Coins - ",
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                    LottieBuilder.asset(
                      "Assets/winning_coin.json",
                      height: 30,
                      width: 20,
                      frameRate: FrameRate.max,
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection("user")
                          .doc(FirebaseAuth.instance.currentUser!.email
                              .toString())
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          int coins = snapshot!.data!.data()!["winCoins"];
                          balance = coins;
                          winCoins = coins;
                          return Text(
                            coins.toString(),
                            style:
                                TextStyle(color: Colors.yellow, fontSize: 20),
                          );
                        } else {
                          balance = 0;
                          return Text("0");
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Form(
              key: fromKey,
              child: Padding(
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: TextFormField(
                  controller: mainController.winCoins,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter some Amount";
                    } else if (int.parse(mainController.winCoins.text) >
                        winCoins) {
                      return "Don't have this much win coins";
                    } else if (int.parse(mainController.winCoins.text) < 10) {
                      return "Can't be less than ten";
                    } else {
                      return null;
                    }
                  },
                  onChanged: (value) {
                    mainController.palyCoins.value = value;
                  },
                  keyboardType: TextInputType.number,
                  style: const TextStyle(
                      color: Colors.white60,
                      decoration: TextDecoration.none,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                  decoration: const InputDecoration(
                    fillColor: Colors.transparent,
                    hintText: "Win Coins Amount",
                    hintStyle: TextStyle(color: Colors.white60, fontSize: 24),
                    prefixIcon: Icon(
                      Icons.pending,
                      color: Colors.white60,
                      size: 28,
                    ),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: Colors.red)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: Colors.white60)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: Colors.purple)),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Icon(
                Icons.arrow_downward_rounded,
                color: Colors.white60,
                size: 50,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "You will get ",
                  style: TextStyle(color: Colors.white70, fontSize: 18),
                ),
                LottieBuilder.asset("Assets/coin.json"),
                const SizedBox(
                  width: 2,
                ),
                Obx(
                  () => Text(
                    mainController.palyCoins.value == ""
                        ? "0"
                        : mainController.palyCoins.value,
                    style: TextStyle(color: Colors.white70, fontSize: 18),
                  ),
                ),
                const Text(
                  " in you account",
                  style: TextStyle(color: Colors.white70, fontSize: 18),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            mainController.exchangeLoading.value
                ? ElevatedButton(
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    side:
                                        const BorderSide(color: Colors.green))),
                        backgroundColor:
                            const MaterialStatePropertyAll(Colors.green)),
                    onPressed: () {},
                    child: CircularProgressIndicator())
                : ElevatedButton(
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    side:
                                        const BorderSide(color: Colors.green))),
                        backgroundColor:
                            const MaterialStatePropertyAll(Colors.green)),
                    onPressed: () async {
                      final from = fromKey.currentState!;
                      if (from.validate()) {
                        int a = int.parse(mainController.winCoins.text);
                        mainController.exchangeCoins(a);
                      }
                    },
                    child: const Text(
                      "Exchange Now",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Facing issue?",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                const SizedBox(
                  width: 15,
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => const SupportScreen());
                  },
                  child: const Text(
                    "Contact Us",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.blue,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Note that : You can only exchange win coins to play coins',
                style: TextStyle(
                    fontSize: 17,
                    color: Colors.orange,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ]),
        ));
  }
}
