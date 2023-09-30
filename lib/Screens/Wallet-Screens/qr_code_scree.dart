import 'package:flutter/material.dart';
import 'package:gamaru_mobile_app/Controllers/Wallet-Controller/walletController.dart';
import 'package:get/get.dart';
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
          Center(
            child: UPIPaymentQRCode(
              embeddedImagePath: "Assets/g_Logo.png",
              embeddedImageSize: const Size(60, 60),
              upiDetails: upiDetails!,
              size: 200,
            ),
          ),
          ElevatedButton(
              onPressed: () async {
                String upiurl =
                    'upi://pay?pa=9064983473@apl&pn=JoySarkar&tn=TestingGpay&am=10&cu=INR';
                await launchUrl(Uri.parse(upiurl));
              },
              child: Text("joy"))
        ],
      ),
    );
  }
}
