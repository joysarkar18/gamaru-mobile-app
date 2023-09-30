import 'package:flutter/material.dart';
import 'package:gamaru_mobile_app/Componants/glossyEffect.dart';
import 'package:get/get.dart';

class UpiScreen extends StatelessWidget {
  const UpiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: Get.height * .07,
            ),
            Center(
              child: SizedBox(
                height: 200,
                width: 200,
                child: Image.asset('Assets/upi.jpeg'),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text(
                'Scan to pay with UPI app',
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 19),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: SizedBox(
                height: 50,
                width: 200,
                child: FloatingActionButton(
                  onPressed: () {},
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
            Padding(
              padding: const EdgeInsets.only(
                  top: 20.0, left: 50, right: 50, bottom: 5),
              child: GlossyCard(
                borderRadius: 15.0,
                borderWith: 1.0,
                height: 60.0,
                width: 300.0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      hintText: "Enter your refarence i'd",
                      hintStyle: TextStyle(
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.w400,
                        fontSize: 17,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: SizedBox(
                height: 50,
                width: 150,
                child: FloatingActionButton(
                  onPressed: () {},
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
              height: Get.height * .15,
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
                      Icon(
                        Icons.warning_amber_outlined,
                        size: 50.0,
                        color: Colors.red,
                      ),
                      Column(
                        children: [
                          Text(
                            'Do not exit this page until payment is',
                            style: TextStyle(fontSize: 17),
                          ),
                          Text(
                            'done.',
                            style: TextStyle(fontSize: 17),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
