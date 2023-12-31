import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gamaru_mobile_app/Componants/glossyEffect.dart';
import 'package:gamaru_mobile_app/Controllers/Main-Controller/mainController.dart';
import 'package:gamaru_mobile_app/Controllers/Wallet-Controller/walletController.dart';
import 'package:gamaru_mobile_app/Screens/Customer%20Support/SupportScreen.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:razorpay_flutter/razorpay_flutter.dart';

import 'RechargeDone.dart';
import 'RechargeFailed.dart';

class AddMoney extends StatefulWidget {
  const AddMoney({super.key});

  @override
  State<AddMoney> createState() => _AddMoneyState();
}

class _AddMoneyState extends State<AddMoney> {
  // final _razorpay = Razorpay();
  final fromKey = GlobalKey<FormState>();
  final walletController = Get.put(WalletController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    walletController.adMoneyController.text = "";

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      appBar: AppBar(
          backgroundColor: Colors.black,
          iconTheme: const IconThemeData(color: Colors.white),
          title: InkWell(
            onTap: () => Get.to(RechargeFailed()),
            child: const Text(
              "RECHARGE",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          )),
      body: SingleChildScrollView(
        child: SizedBox(
          width: Get.width,
          child: Column(children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 48,
              width: 250,
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
                      "Balance - ",
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
            Form(
              key: fromKey,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    TextFormField(
                      controller: walletController.adMoneyController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter some Amount";
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.number,
                      style: const TextStyle(
                          color: Colors.white60,
                          decoration: TextDecoration.none,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                      decoration: const InputDecoration(
                        fillColor: Colors.transparent,
                        hintText: "Enter the amount",
                        hintStyle:
                            TextStyle(color: Colors.white60, fontSize: 24),
                        prefixIcon: Icon(
                          Icons.currency_rupee_rounded,
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
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: walletController.rechargeNoController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter your Number";
                        } else if (value.length < 10) {
                          return "Invalid Number";
                        } else if (value.length > 10) {
                          return "Invalid Number";
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.number,
                      style: const TextStyle(
                          color: Colors.white60,
                          decoration: TextDecoration.none,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                      decoration: const InputDecoration(
                        fillColor: Colors.transparent,
                        hintText: "Enter Phone Number",
                        hintStyle:
                            TextStyle(color: Colors.white60, fontSize: 24),
                        prefixIcon: Icon(
                          Icons.phone_android_rounded,
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
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        walletController.adMoneyController.text = "10";
                      },
                      child: const GlossyCard(
                          height: 50.0,
                          width: 100.0,
                          borderRadius: 10.0,
                          borderWith: 2.0,
                          child: Text(
                            "₹10",
                            style: TextStyle(
                                color: Colors.white70,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                    InkWell(
                      onTap: () {
                        walletController.adMoneyController.text = "20";
                      },
                      child: const GlossyCard(
                          height: 50.0,
                          width: 100.0,
                          borderRadius: 10.0,
                          borderWith: 2.0,
                          child: Text(
                            "₹20",
                            style: TextStyle(
                                color: Colors.white70,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                    InkWell(
                      onTap: () {
                        walletController.adMoneyController.text = "30";
                      },
                      child: const GlossyCard(
                          height: 50.0,
                          width: 100.0,
                          borderRadius: 10.0,
                          borderWith: 2.0,
                          child: Text(
                            "₹30",
                            style: TextStyle(
                                color: Colors.white70,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        walletController.adMoneyController.text = "50";
                      },
                      child: const GlossyCard(
                          height: 50.0,
                          width: 100.0,
                          borderRadius: 10.0,
                          borderWith: 2.0,
                          child: Text(
                            "₹50",
                            style: TextStyle(
                                color: Colors.white70,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                    InkWell(
                      onTap: () {
                        walletController.adMoneyController.text = "100";
                      },
                      child: const GlossyCard(
                          height: 50.0,
                          width: 100.0,
                          borderRadius: 10.0,
                          borderWith: 2.0,
                          child: Text(
                            "₹100",
                            style: TextStyle(
                                color: Colors.white70,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                    InkWell(
                      onTap: () {
                        walletController.adMoneyController.text = "200";
                      },
                      child: const GlossyCard(
                          height: 50.0,
                          width: 100.0,
                          borderRadius: 10.0,
                          borderWith: 2.0,
                          child: Text(
                            "₹200",
                            style: TextStyle(
                                color: Colors.white70,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        walletController.adMoneyController.text = "400";
                      },
                      child: const GlossyCard(
                          height: 50.0,
                          width: 100.0,
                          borderRadius: 10.0,
                          borderWith: 2.0,
                          child: Text(
                            "₹400",
                            style: TextStyle(
                                color: Colors.white70,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                    InkWell(
                      onTap: () {
                        walletController.adMoneyController.text = "500";
                      },
                      child: const GlossyCard(
                          height: 50.0,
                          width: 100.0,
                          borderRadius: 10.0,
                          borderWith: 2.0,
                          child: Text(
                            "₹500",
                            style: TextStyle(
                                color: Colors.white70,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                    InkWell(
                      onTap: () {
                        walletController.adMoneyController.text = "1000";
                      },
                      child: const GlossyCard(
                          height: 50.0,
                          width: 100.0,
                          borderRadius: 10.0,
                          borderWith: 2.0,
                          child: Text(
                            "₹1000",
                            style: TextStyle(
                                color: Colors.white70,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                              side: BorderSide(color: Colors.green))),
                      backgroundColor: MaterialStatePropertyAll(Colors.green)),
                  onPressed: () async {
                    final from = fromKey.currentState!;
                    if (from.validate()) {
                      walletController
                          .getUpiId(walletController.phoneNoController.text);
                    }
                  },
                  child: Text(
                    "Recharge Now",
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
                    ),
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  "or",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () async {
                    var url = Uri.parse(
                        "${MainController.instance.urls["howToRecharge"]}");
                    await launchUrl(url);
                  },
                  child: const Text(
                    "Watch Video",
                    style: TextStyle(
                      color: Colors.cyan,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.cyan,
                    ),
                  ),
                )
              ]),
            )
          ]),
        ),
      ),
    );
  }
}

// void _handlePaymentSuccess(PaymentSuccessResponse response) {
//   // Do something when payment succeeds
//   WalletController.instance.paymentSuccess(
//       int.parse(WalletController.instance.adMoneyController.text));
// }

// void _handlePaymentError(PaymentFailureResponse response) {
//   Get.to(const RechargeFailed());
//   // Do something when payment fails
// }

// void _handleExternalWallet(ExternalWalletResponse response) {
//   // Do something when an external wallet was selected
// }
