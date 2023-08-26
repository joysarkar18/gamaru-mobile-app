import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gamaru_mobile_app/Componants/glossyEffect.dart';
import 'package:gamaru_mobile_app/Controllers/Wallet-Controller/walletController.dart';
import 'package:gamaru_mobile_app/Screens/Customer%20Support/SupportScreen.dart';
import 'package:gamaru_mobile_app/Screens/Wallet-Screens/addBankCard.dart';
import 'package:gamaru_mobile_app/Screens/Wallet-Screens/bankCard.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'withdrawComplete.dart';
import 'withdrawFaild.dart';

class WithdrawScreen extends StatefulWidget {
  const WithdrawScreen({super.key});

  @override
  State<WithdrawScreen> createState() => _WithdrawScreenState();
}

class _WithdrawScreenState extends State<WithdrawScreen> {
  final fromKey = GlobalKey<FormState>();
  final walletController = Get.put(WalletController());

  @override
  void initState() {
    super.initState();
    walletController.getBankCardList();
  }

  @override
  Widget build(BuildContext context) {
    walletController.withdrawMoneyController.text = "";
    walletController.fee.value = "0";
    walletController.toAccount.value = "0";
    walletController.bankCardDetails = null;
    int balance = 0;

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
      body: Stack(
        children: [
          SizedBox(
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
                            .doc(FirebaseAuth.instance.currentUser!.email
                                .toString())
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            int coins = snapshot!.data!.data()!["winCoins"];
                            balance = coins;
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
              SizedBox(
                height: 40,
              ),
              Form(
                key: fromKey,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: TextFormField(
                    onChanged: (value) {
                      walletController.fee.value = ((double.parse(
                                      walletController
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
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          borderSide: BorderSide(color: Colors.red)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          borderSide: BorderSide(color: Colors.white60)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
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
              Obx(
                () => Container(
                  child: DropdownMenu(
                    onSelected: (value) {
                      if (value == "") {
                        Get.to(() => AddBankCard());
                      } else {
                        walletController.bankCardDetails = value;
                      }
                    },
                    hintText: "Select your Bank Card",
                    menuStyle: MenuStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            Color.fromARGB(255, 33, 7, 78))),
                    label: Text(
                      "Select your Bank card",
                      style: TextStyle(color: Colors.white),
                    ),
                    leadingIcon: Icon(
                      Icons.payment_rounded,
                      color: Colors.white70,
                    ),
                    textStyle: TextStyle(color: Colors.white),
                    width: Get.width - 60,
                    dropdownMenuEntries: [
                      ...walletController.bankCardList.value.map((ele) {
                        return DropdownMenuEntry(
                          style: ButtonStyle(
                              foregroundColor:
                                  MaterialStatePropertyAll(Colors.white)),
                          value: ele,
                          label: ele["bankName"] +
                              " , " +
                              ele["accNoorUpi"].toString().substring(0, 4) +
                              "...",
                          leadingIcon: Icon(
                            Icons.credit_card_outlined,
                            color: Colors.white70,
                          ),
                        );
                      }).toList(),
                      DropdownMenuEntry(
                        style: ButtonStyle(
                            foregroundColor:
                                MaterialStatePropertyAll(Colors.white)),
                        value: "",
                        label: "Add new Bank Card",
                        leadingIcon: Icon(
                          Icons.add_card,
                          color: Colors.white70,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(children: [
                  const SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      side: BorderSide(color: Colors.green))),
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.green)),
                      onPressed: () {
                        final from = fromKey.currentState!;
                        if (from.validate()) {
                          if (walletController.bankCardDetails == null) {
                            Get.snackbar("Error", "Select a Bank Card",
                                colorText: Colors.red);
                          } else if (int.parse(walletController
                                  .withdrawMoneyController.text) >
                              balance) {
                            Get.snackbar(
                                "Error", "Doesn't have sufficient balance",
                                colorText: Colors.red);
                          } else {
                            int amount = double.parse(walletController
                                    .withdrawMoneyController.text)
                                .floor();
                            int fee = double.parse(walletController.fee.value)
                                .floor();

                            walletController.withdrawAmount(
                                amount, walletController.bankCardDetails, fee);
                            print("hiiii");
                          }
                        }
                      },
                      child: InkWell(
                        onTap: () {
                          Get.to(WithdrawFailed());
                        },
                        child: const Text(
                          "Withdraw",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
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
          Obx(
            () => walletController.is_withdrawing.value
                ? Container(
                    color: const Color.fromARGB(39, 158, 158, 158),
                    height: Get.height,
                    width: Get.width,
                    child: Center(
                      child: LottieBuilder.asset(
                        "Assets/money_shower.json",
                        frameRate: FrameRate.max,
                      ),
                    ),
                  )
                : const Text(""),
          ),
        ],
      ),
    );
  }
}
