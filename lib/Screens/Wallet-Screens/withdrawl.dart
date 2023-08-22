import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gamaru_mobile_app/Componants/glossyEffect.dart';
import 'package:gamaru_mobile_app/Controllers/Wallet-Controller/walletController.dart';
import 'package:gamaru_mobile_app/Screens/Customer%20Support/SupportScreen.dart';
import 'package:gamaru_mobile_app/Screens/Wallet-Screens/bankCard.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class WithdrawScreen extends StatefulWidget {
  const WithdrawScreen({super.key});

  @override
  State<WithdrawScreen> createState() => _WithdrawScreenState();
}

class _WithdrawScreenState extends State<WithdrawScreen> {
  @override
  Widget build(BuildContext context) {
    final fromKey = GlobalKey<FormState>();
    final walletController = Get.put(WalletController());
    walletController.withdrawMoneyController.text = "";
    walletController.fee.value = "0";
    walletController.toAccount.value = "0";

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      appBar: AppBar(
          actions: [
            InkWell(
                onTap: () {
                  Get.to(() => BankCard());
                },
                child: Icon(
                  Icons.account_balance_wallet_rounded,
                  size: 30,
                )),
            SizedBox(
              width: 15,
            )
          ],
          backgroundColor: Colors.black,
          iconTheme: IconThemeData(color: Colors.white),
          title: const Text(
            "WITHDRAWAL",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          )),
      body: SizedBox(
        width: Get.width,
        child: Column(children: [
          SizedBox(
            height: 50,
          ),
          Container(
            height: 48,
            width: 250,
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 78, 78, 78).withOpacity(0.9),
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
                        .doc(
                            FirebaseAuth.instance.currentUser!.email.toString())
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        int coins = snapshot!.data!.data()!["winCoins"];
                        return Text(
                          coins.toString(),
                          style: TextStyle(color: Colors.yellow, fontSize: 20),
                        );
                      } else {
                        return Text("0");
                      }
                    },
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Form(
            key: fromKey,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: TextFormField(
                onChanged: (value) {
                  walletController.fee.value = ((double.parse(walletController
                                  .withdrawMoneyController.text) *
                              0.10)
                          .floor())
                      .toString();
                  walletController.toAccount.value = ((double.parse(value) -
                              double.parse(walletController.fee.value))
                          .floor())
                      .toString();
                },
                controller: walletController.withdrawMoneyController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please Enter some Amount";
                  } else if (int.parse(value) < 100) {
                    return "Minimum Withdraw Amount is 100";
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
                  hintStyle: TextStyle(color: Colors.white60, fontSize: 24),
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
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: Row(
              children: [
                Obx(
                  () => Text(
                    "Fee : ₹" +
                        walletController.fee.value +
                        " , To Account : ₹" +
                        walletController.toAccount.value,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(children: [
              const SizedBox(
                height: 50,
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
                      // Get.to(() => PaymentPage(
                      //     amount: double.parse(
                      //         walletController.adMoneyController.text)));
                    }
                  },
                  child: const Text(
                    "Withdraw",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 20,
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
                      Get.to(() => SupportScreen());
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
              )
            ]),
          )
        ]),
      ),
    );
  }
}
