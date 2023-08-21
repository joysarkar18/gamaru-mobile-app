import 'package:flutter/material.dart';

class AddBankCard extends StatelessWidget {
  const AddBankCard({super.key});

  @override
  Widget build(BuildContext context) {
    final fromKey = GlobalKey<FormState>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Colors.black,
          title: const Text(
            "ADD BANK CARD",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          )),
      body: ListView(
        children: [
          Text(
            "  Please fill all the information carefully and correct",
            style: TextStyle(color: Colors.red),
          ),
          Center(
              child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                    key: fromKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          " Enter your Account number or UPI id *",
                          style: TextStyle(color: Colors.white70, fontSize: 16),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter your Account No/UPI";
                            } else {
                              return null;
                            }
                          },
                          style: const TextStyle(
                              color: Colors.white60,
                              decoration: TextDecoration.none),
                          decoration: const InputDecoration(
                            fillColor: Colors.transparent,
                            hintText: "Enter your Account NO/UPI",
                            hintStyle: TextStyle(color: Colors.white60),
                            prefixIcon: Icon(
                              Icons.payment_rounded,
                              color: Colors.white60,
                            ),
                            errorBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(color: Colors.red)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(color: Colors.white60)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(color: Colors.purple)),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          " Enter your Name as per Bank Account *",
                          style: TextStyle(color: Colors.white70, fontSize: 16),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter your Name";
                            } else {
                              return null;
                            }
                          },
                          style: const TextStyle(
                              color: Colors.white60,
                              decoration: TextDecoration.none),
                          decoration: const InputDecoration(
                            fillColor: Colors.transparent,
                            hintText: "Enter your Name",
                            hintStyle: TextStyle(color: Colors.white60),
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.white60,
                            ),
                            errorBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(color: Colors.red)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(color: Colors.white60)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(color: Colors.purple)),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          " Enter your Phone No *",
                          style: TextStyle(color: Colors.white70, fontSize: 16),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter yoour phone number";
                            } else if (value.length < 10) {
                              return "Enter a Valid Phone Number";
                            } else {
                              return null;
                            }
                          },
                          style: const TextStyle(
                              color: Colors.white60,
                              decoration: TextDecoration.none),
                          decoration: const InputDecoration(
                            fillColor: Colors.transparent,
                            hintText: "Enter your Phone No",
                            hintStyle: TextStyle(color: Colors.white60),
                            prefixIcon: Icon(
                              Icons.phone_android_rounded,
                              color: Colors.white60,
                            ),
                            errorBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(color: Colors.red)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(color: Colors.white60)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(color: Colors.purple)),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          " Enter IFSC Code *",
                          style: TextStyle(color: Colors.white70, fontSize: 16),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter your IFSC Code";
                            } else {
                              return null;
                            }
                          },
                          style: const TextStyle(
                              color: Colors.white60,
                              decoration: TextDecoration.none),
                          decoration: const InputDecoration(
                            fillColor: Colors.transparent,
                            hintText: "Enter IFSC Code",
                            hintStyle: TextStyle(color: Colors.white60),
                            prefixIcon: Icon(
                              Icons.card_giftcard,
                              color: Colors.white60,
                            ),
                            errorBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(color: Colors.red)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(color: Colors.white60)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(color: Colors.purple)),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          " Enter your Address *",
                          style: TextStyle(color: Colors.white70, fontSize: 16),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter your Address";
                            } else {
                              return null;
                            }
                          },
                          style: const TextStyle(
                              color: Colors.white60,
                              decoration: TextDecoration.none),
                          decoration: const InputDecoration(
                            fillColor: Colors.transparent,
                            hintText: "Enter your Address",
                            hintStyle: TextStyle(color: Colors.white60),
                            prefixIcon: Icon(
                              Icons.location_city,
                              color: Colors.white60,
                            ),
                            errorBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(color: Colors.red)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(color: Colors.white60)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(color: Colors.purple)),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          " Enter your PIN Code *",
                          style: TextStyle(color: Colors.white70, fontSize: 16),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter your PIN Code";
                            } else {
                              return null;
                            }
                          },
                          style: const TextStyle(
                              color: Colors.white60,
                              decoration: TextDecoration.none),
                          decoration: const InputDecoration(
                            fillColor: Colors.transparent,
                            hintText: "Enter your PIN Code",
                            hintStyle: TextStyle(color: Colors.white60),
                            prefixIcon: Icon(
                              Icons.pin_drop_rounded,
                              color: Colors.white60,
                            ),
                            errorBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(color: Colors.red)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(color: Colors.white60)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(color: Colors.purple)),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            side: BorderSide(
                                                color: Colors.green))),
                                    backgroundColor:
                                        MaterialStatePropertyAll(Colors.green)),
                                onPressed: () async {
                                  final from = fromKey.currentState!;
                                  if (from.validate()) {}
                                },
                                child: const Text(
                                  "SUBMIT",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                )),
                          ],
                        ),
                        SizedBox(
                          height: 400,
                        )
                      ],
                    )),
              )
            ],
          )),
        ],
      ),
    );
  }
}
