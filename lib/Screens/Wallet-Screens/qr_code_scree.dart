import 'package:flutter/material.dart';
import 'package:gamaru_mobile_app/Controllers/Wallet-Controller/walletController.dart';
import 'package:get/get.dart';
import 'package:timer_count_down/timer_count_down.dart';
import 'package:upi_payment_qrcode_generator/upi_payment_qrcode_generator.dart';
import 'package:url_launcher/url_launcher.dart';

class QrCodeScreen extends StatefulWidget {
  const QrCodeScreen({super.key});

  @override
  State<QrCodeScreen> createState() => _QrCodeScreenState();
}

class _QrCodeScreenState extends State<QrCodeScreen> {
  final walletController = Get.put(WalletController());
  UPIDetails? upiDetails = null;
  @override
  void initState() {
    // TODO: implement initState
    upiDetails = UPIDetails(
        upiID: walletController.upiId.value,
        payeeName: "Gamaru app",
        amount: double.parse(walletController.adMoneyController.text),
        transactionNote: "Recharge for Gamaru",
        transactionID: "906498347323");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Countdown(
            seconds: 300,
            build: (BuildContext context, double time) => Text(
                (time / 60).toInt().toString() +
                    ":" +
                    (time % 60).toInt().toString()),
            interval: Duration(seconds: 1),
            onFinished: () {
              print('Timer is done!');
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Center(
              child: UPIPaymentQRCode(
                embeddedImagePath: "Assets/gQr.png",
                embeddedImageSize: Size(Get.width * 0.17, Get.width * 0.17),
                upiDetails: upiDetails!,
                size: Get.width * 0.7,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
