import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gamaru_mobile_app/Screens/otp_page.dart';
import 'package:get/get.dart';

import '../../Componants/glossyEffect.dart';
import '../../Controllers/Login-Contollers/signinSignupController.dart';
import 'login_page.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _isVisible1 = false;
  bool _isVisible2 = false;
  final fromKey = GlobalKey<FormState>();
  void updateStatus1() {
    setState(() {
      _isVisible1 = !_isVisible1;
    });
  }

  void updateStatus2() {
    setState(() {
      _isVisible2 = !_isVisible2;
    });
  }

  @override
  Widget build(BuildContext context) {
    final signupController = Get.put(SignupController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("Assets/bgSignup.jpg"), fit: BoxFit.cover)),
        child: Container(
          padding: EdgeInsets.only(top: 30),
          child: Center(
            child: GlossyCard(
                borderWith: 0.4,
                height: Get.height * 0.85,
                width: Get.width * 0.89,
                borderRadius: 15.0,
                child: SingleChildScrollView(
                  child: Container(
                      padding: EdgeInsets.only(top: 15, bottom: 10),
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
                            style:
                                TextStyle(color: Colors.white70, fontSize: 16),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Form(
                              key: fromKey,
                              child: Column(
                                children: [
                                  TextFormField(
                                    controller:
                                        signupController.phoneNumberController,
                                    keyboardType: TextInputType.phone,
                                    validator: (value) => validatePhone(value),
                                    style: TextStyle(
                                        color: Colors.white60,
                                        decoration: TextDecoration.none),
                                    decoration: const InputDecoration(
                                      fillColor: Colors.transparent,
                                      hintText: "Phone no",
                                      hintStyle:
                                          TextStyle(color: Colors.white60),
                                      prefixIcon: Icon(
                                        Icons.phone_android,
                                        color: Colors.white60,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          borderSide: BorderSide(
                                              color: Colors.white60)),
                                      errorBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          borderSide:
                                              BorderSide(color: Colors.red)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          borderSide:
                                              BorderSide(color: Colors.purple)),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    controller:
                                        signupController.emailController,
                                    keyboardType: TextInputType.emailAddress,
                                    autofillHints: const [AutofillHints.email],
                                    validator: (email) => email != null &&
                                            !EmailValidator.validate(email)
                                        ? "Enter a valid email"
                                        : null,
                                    style: TextStyle(
                                        color: Colors.white60,
                                        decoration: TextDecoration.none),
                                    decoration: const InputDecoration(
                                      fillColor: Colors.transparent,
                                      hintText: "Email",
                                      hintStyle:
                                          TextStyle(color: Colors.white60),
                                      prefixIcon: Icon(
                                        Icons.email_rounded,
                                        color: Colors.white60,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          borderSide: BorderSide(
                                              color: Colors.white60)),
                                      errorBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          borderSide:
                                              BorderSide(color: Colors.red)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          borderSide:
                                              BorderSide(color: Colors.purple)),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    controller:
                                        signupController.passwordController1,
                                    keyboardType: TextInputType.visiblePassword,
                                    obscureText: !_isVisible1,
                                    validator: (value) =>
                                        validatePassword(value),
                                    style: TextStyle(
                                        color: Colors.white60,
                                        decoration: TextDecoration.none),
                                    decoration: InputDecoration(
                                      fillColor: Colors.transparent,
                                      hintText: "psaaword",
                                      hintStyle:
                                          TextStyle(color: Colors.white60),
                                      prefixIcon: const Icon(
                                        Icons.lock,
                                        color: Colors.white60,
                                      ),
                                      suffixIcon: IconButton(
                                          color: Colors.white60,
                                          onPressed: () => updateStatus1(),
                                          icon: Icon(_isVisible1
                                              ? Icons.visibility
                                              : Icons.visibility_off)),
                                      errorBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          borderSide:
                                              BorderSide(color: Colors.red)),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          borderSide: BorderSide(
                                              color: Colors.white60)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          borderSide:
                                              BorderSide(color: Colors.purple)),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  TextFormField(
                                    controller:
                                        signupController.passwordController2,
                                    keyboardType: TextInputType.visiblePassword,
                                    obscureText: !_isVisible2,
                                    validator: (value) =>
                                        validatePassword(value),
                                    style: TextStyle(
                                        color: Colors.white60,
                                        decoration: TextDecoration.none),
                                    decoration: InputDecoration(
                                      fillColor: Colors.transparent,
                                      hintText: "Confirm psaaword",
                                      hintStyle:
                                          TextStyle(color: Colors.white60),
                                      prefixIcon: Icon(
                                        Icons.lock,
                                        color: Colors.white60,
                                      ),
                                      suffixIcon: IconButton(
                                          color: Colors.white60,
                                          onPressed: () => updateStatus2(),
                                          icon: Icon(_isVisible2
                                              ? Icons.visibility
                                              : Icons.visibility_off)),
                                      errorBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          borderSide:
                                              BorderSide(color: Colors.red)),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          borderSide: BorderSide(
                                              color: Colors.white60)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          borderSide:
                                              BorderSide(color: Colors.purple)),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      final from = fromKey.currentState!;
                                      if (from.validate()) {
                                        // signupController.registerUser(
                                        //     signupController
                                        //         .emailController.text,
                                        //     signupController
                                        //         .passwordController1.text);

                                        await FirebaseAuth.instance
                                            .verifyPhoneNumber(
                                          phoneNumber: "+91" +
                                              signupController
                                                  .phoneNumberController.text,
                                          verificationCompleted:
                                              (PhoneAuthCredential
                                                  credential) {},
                                          verificationFailed:
                                              (FirebaseAuthException e) {},
                                          codeSent: (String verificationId,
                                              int? resendToken) {},
                                          codeAutoRetrievalTimeout:
                                              (String verificationId) {},
                                        )
                                            .then((value) {
                                          print("sign up complete");
                                          Get.to(OtpPage());
                                        });
                                      }
                                    },
                                    child: Container(
                                      width: Get.width * 0.79,
                                      height: 50,
                                      decoration: const BoxDecoration(
                                          gradient: LinearGradient(
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,
                                              colors: [
                                                Colors.purple,
                                                Colors.blue,
                                              ]),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      child: Center(
                                          child: Text(
                                        "Signup",
                                        style: TextStyle(
                                            color: Colors.white60,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 18),
                                      )),
                                    ),
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
                                "Already have account ?",
                                style: TextStyle(color: Colors.white60),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.off(Login(),
                                      transition: Transition.rightToLeft);
                                },
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                      )),
                )),
          ),
        ),
      ),
    );
  }
}

String? validatePassword(String? pass) {
  if (pass == null || pass.isEmpty) {
    return "please enter the password";
  }

  if (pass.length < 5) {
    return "password can't be to short";
  }

  return null;
}

String? validatePhone(String? pass) {
  if (pass == null || pass.isEmpty) {
    return "please enter the phone no";
  }

  if (pass.length < 10) {
    return "wrong number please check!";
  }

  return null;
}