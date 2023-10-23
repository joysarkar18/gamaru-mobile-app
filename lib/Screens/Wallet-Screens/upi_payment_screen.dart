import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:gamaru_mobile_app/Componants/glossyEffect.dart';
import 'package:gamaru_mobile_app/Controllers/Wallet-Controller/walletController.dart';
import 'package:gamaru_mobile_app/Screens/navigation_bar.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';
import 'package:timer_count_down/timer_count_down.dart';
import 'package:upi_payment_qrcode_generator/upi_payment_qrcode_generator.dart';

class UpiScreen extends StatefulWidget {
  final String phNo;
  const UpiScreen({super.key, required this.phNo});

  @override
  State<UpiScreen> createState() => _UpiScreenState();
}

class _UpiScreenState extends State<UpiScreen> {
  ScreenshotController sc = ScreenshotController();
  final walletController = Get.put(WalletController());
  final fromKey = GlobalKey<FormState>();
  UPIDetails? upiDetails;
  Uint8List? _imageFile;
  var qr;
  @override
  void initState() {
    // TODO: implement initState
    upiDetails = UPIDetails(
        upiID: walletController.upiId.value,
        payeeName: "Gamaru app",
        amount: double.parse(walletController.adMoneyController.text),
        transactionNote: "Recharge for Gamaru",
        transactionID: "906498347323");

    qr = Builder(
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: UPIPaymentQRCode(
              embeddedImagePath: "Assets/gQr.png",
              embeddedImageSize: Size(Get.width * 0.17, Get.width * 0.17),
              upiDetails: upiDetails!,
              size: Get.width * 0.7,
            ),
          ),
        );
      },
    );

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    walletController.refNoController.text = "";
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SafeArea(
          child: SizedBox(
            height: Get.height * 1.4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: Get.height * .01,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black12,
                        ),
                        borderRadius: BorderRadius.circular(14)),
                    child: const Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.warning_amber_outlined,
                            size: 45.0,
                            color: Colors.red,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Column(
                            children: [
                              Text(
                                'Do not exit this page until payment is',
                                style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.orange,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                'done.',
                                style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.orange,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Countdown(
                  seconds: 600,
                  build: (BuildContext context, double time) => Text(
                    "${(time / 60).toInt()} Min ${(time % 60).toInt()} Sec",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w800),
                  ),
                  interval: const Duration(seconds: 1),
                  onFinished: () {
                    Get.off(MainScreen());
                  },
                ),
                qr,
                // Screenshot(
                //   controller: sc,
                //   child: Padding(
                //     padding: const EdgeInsets.all(10),
                //     child: Center(
                //       child: UPIPaymentQRCode(
                //         // embeddedImagePath: "Assets/gQr.png",
                //         // embeddedImageSize:
                //         //     Size(Get.width * 0.17, Get.width * 0.17),
                //         upiDetails: upiDetails!,
                //         size: Get.width * 0.7,
                //       ),
                //     ),
                //   ),
                // ),
                const Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text(
                    'Scan to pay with UPI apps',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 19),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 5.0),
                  child: Text(
                    'or',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 19),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: SizedBox(
                    height: 50,
                    width: 200,
                    child: FloatingActionButton(
                      onPressed: () async {
                        sc
                            .captureFromLongWidget(
                          InheritedTheme.captureAll(
                            context,
                            Material(
                              child: qr,
                            ),
                          ),
                          delay: Duration(milliseconds: 100),
                          context: context,

                          ///
                          /// Additionally you can define constraint for your image.
                          ///
                          /// constraints: BoxConstraints(
                          ///   maxHeight: 1000,
                          ///   maxWidth: 1000,
                          /// )
                        )
                            .then((capturedImage) async {
                          // Handle captured image
                          _imageFile = capturedImage;
                          // Request permission to write to external storage

                          // print("hiiii");
                          var status =
                              await Permission.manageExternalStorage.request();
                          if (status != PermissionStatus.granted) {
                            // Permission denied
                            print("hiiii");
                            return;
                          }

                          // Save image to gallery
                          final result =
                              await ImageGallerySaver.saveImage(_imageFile!);
                          print(
                              result); // Result is a boolean indicating whether the operati
                        });

                        // sc.capture().then((value) async {
                        //   _imageFile = value;
                        //   // Request permission to write to external storage

                        //   // print("hiiii");
                        //   var status =
                        //       await Permission.manageExternalStorage.request();
                        //   if (status != PermissionStatus.granted) {
                        //     // Permission denied
                        //     print("hiiii");
                        //     return;
                        //   }

                        //   // Save image to gallery
                        //   final result =
                        //       await ImageGallerySaver.saveImage(_imageFile!);
                        //   print(
                        //       result); // Result is a boolean indicating whether the operati
                        // });
                      },
                      child: const Text(
                        'Download QR code',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.0),
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                  child: Text(
                    "then",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 19),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 20.0, left: 50, right: 50, bottom: 5),
                  child: GlossyCard(
                    borderRadius: 8.0,
                    borderWith: 1.0,
                    height: 60.0,
                    width: Get.width * 0.8,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(0),
                      ),
                      child: Form(
                        key: fromKey,
                        child: TextFormField(
                          controller: walletController.refNoController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter your transaction Id";
                            } else {
                              return null;
                            }
                          },
                          keyboardType: TextInputType.number,
                          style: const TextStyle(
                              color: Colors.black87,
                              decoration: TextDecoration.none,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                          decoration: const InputDecoration(
                            fillColor: Colors.transparent,
                            hintText: "Enter UPI transaction ID",
                            hintStyle:
                                TextStyle(color: Colors.black87, fontSize: 16),
                            prefixIcon: Icon(
                              Icons.arrow_circle_right_rounded,
                              color: Colors.black87,
                              size: 28,
                            ),
                            errorBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(color: Colors.red)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(
                                  color: Colors.black87,
                                )),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(color: Colors.purple)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: SizedBox(
                    height: 50,
                    width: 150,
                    child: FloatingActionButton(
                      onPressed: () {
                        final from = fromKey.currentState!;
                        if (from.validate()) {
                          print("hiii");
                          int amount = int.parse(
                              walletController.adMoneyController.text);
                          walletController.paymentSuccess(amount);
                          walletController.saveToAllRecharge(
                              walletController.refNoController.text,
                              amount,
                              widget.phNo);
                        }
                      },
                      backgroundColor: Colors.green,
                      child: const Text(
                        'SUBMIT',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height * .05,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
