import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Componants/glossyEffect.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final signupController = Get.put(SignupController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("Assets/bgsignin.png"), fit: BoxFit.cover)),
        child: Container(
          padding: EdgeInsets.only(top: 30),
          child: Center(
            child: GlossyCard(
                borderWith: 0.4,
                height: Get.height * 0.85,
                width: Get.width * 0.89,
                borderRadius: 15.0,
                child: Container(
                    width: Get.width * 0.79,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Singup",
                          style: TextStyle(
                              color: Colors.white70,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          "Just some details to get you in!",
                          style: TextStyle(color: Colors.white70, fontSize: 16),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Form(
                            child: Column(
                          children: [
                            TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              autofillHints: const [AutofillHints.email],
                              // validator: (email) => email != null &&
                              //         !EmailValidator.validate(email)
                              //     ? "Enter a valid email"
                              //     : null,
                              style: TextStyle(
                                  color: Colors.white60,
                                  decoration: TextDecoration.none),
                              decoration: const InputDecoration(
                                fillColor: Colors.transparent,
                                hintText: "Phone no",
                                hintStyle: TextStyle(color: Colors.white60),
                                prefixIcon: Icon(
                                  Icons.phone_android,
                                  color: Colors.white60,
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    borderSide:
                                        BorderSide(color: Colors.white60)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    borderSide:
                                        BorderSide(color: Colors.purple)),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              autofillHints: const [AutofillHints.email],
                              // validator: (email) => email != null &&
                              //         !EmailValidator.validate(email)
                              //     ? "Enter a valid email"
                              //     : null,
                              style: TextStyle(
                                  color: Colors.white60,
                                  decoration: TextDecoration.none),
                              decoration: const InputDecoration(
                                fillColor: Colors.transparent,
                                hintText: "Email",
                                hintStyle: TextStyle(color: Colors.white60),
                                prefixIcon: Icon(
                                  Icons.email_rounded,
                                  color: Colors.white60,
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    borderSide:
                                        BorderSide(color: Colors.white60)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    borderSide:
                                        BorderSide(color: Colors.purple)),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              autofillHints: const [AutofillHints.email],
                              obscureText: true,
                              // validator: (email) => email != null &&
                              //         !EmailValidator.validate(email)
                              //     ? "Enter a valid email"
                              //     : null,
                              style: TextStyle(
                                  color: Colors.white60,
                                  decoration: TextDecoration.none),
                              decoration: const InputDecoration(
                                fillColor: Colors.transparent,
                                hintText: "psaaword",
                                hintStyle: TextStyle(color: Colors.white60),
                                prefixIcon: const Icon(
                                  Icons.lock,
                                  color: Colors.white60,
                                ),
                                suffixIcon: Icon(
                                  Icons.remove_red_eye_rounded,
                                  color: Colors.white60,
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    borderSide:
                                        BorderSide(color: Colors.white60)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    borderSide:
                                        BorderSide(color: Colors.purple)),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              autofillHints: const [AutofillHints.email],
                              obscureText: true,
                              // validator: (email) => email != null &&
                              //         !EmailValidator.validate(email)
                              //     ? "Enter a valid email"
                              //     : null,
                              style: TextStyle(
                                  color: Colors.white60,
                                  decoration: TextDecoration.none),
                              decoration: const InputDecoration(
                                fillColor: Colors.transparent,
                                hintText: "Confirm psaaword",
                                hintStyle: TextStyle(color: Colors.white60),
                                prefixIcon: const Icon(
                                  Icons.lock,
                                  color: Colors.white60,
                                ),
                                suffixIcon: Icon(
                                  Icons.remove_red_eye_rounded,
                                  color: Colors.white60,
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    borderSide:
                                        BorderSide(color: Colors.white60)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    borderSide:
                                        BorderSide(color: Colors.purple)),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              width: Get.width * 0.79,
                              height: 50,
                              decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [Colors.blue, Colors.purple]),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Center(
                                  child: Text(
                                "Signup",
                                style: TextStyle(
                                    color: Colors.white60,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18),
                              )),
                            )
                          ],
                        )),
                        SizedBox(
                          height: 20,
                        ),
                        Column(children: <Widget>[
                          Row(children: <Widget>[
                            Expanded(
                              child: new Container(
                                  margin: const EdgeInsets.only(
                                      left: 10.0, right: 20.0),
                                  child: Divider(
                                    color: Colors.white30,
                                    height: 36,
                                  )),
                            ),
                            Text(
                              "or",
                              style: TextStyle(color: Colors.white30),
                            ),
                            Expanded(
                              child: new Container(
                                  margin: const EdgeInsets.only(
                                      left: 20.0, right: 10.0),
                                  child: Divider(
                                    color: Colors.white30,
                                    height: 36,
                                  )),
                            ),
                          ]),
                        ]),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have account ?",
                              style: TextStyle(color: Colors.white60),
                            ),
                            InkWell(
                              child: Text(
                                "  Login",
                                style: TextStyle(color: Colors.blue),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Container(
                          width: Get.width * 0.79,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Terms & Conditions",
                                  style: TextStyle(color: Colors.white60),
                                ),
                                Text(
                                  "Support",
                                  style: TextStyle(color: Colors.white60),
                                ),
                                Text(
                                  "Customer Care",
                                  style: TextStyle(color: Colors.white60),
                                ),
                              ]),
                        )
                      ],
                    ))),
          ),
        ),
      ),
    );
  }
}
