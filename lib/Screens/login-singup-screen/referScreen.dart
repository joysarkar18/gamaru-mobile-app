import 'package:flutter/material.dart';
import 'package:gamaru_mobile_app/Componants/background_style.dart';
import 'package:gamaru_mobile_app/Componants/glossyEffect.dart';
import 'package:gamaru_mobile_app/Controllers/Login-Contollers/autehntication.dart';
import 'package:gamaru_mobile_app/Controllers/Login-Contollers/signinSignupController.dart';
import 'package:get/get.dart';

class Refer extends StatefulWidget {
  final bool isGoogel;
  const Refer({super.key, required this.isGoogel});

  @override
  State<Refer> createState() => _ReferState();
}

class _ReferState extends State<Refer> {
  final fromKey = GlobalKey<FormState>();
  final signupController = Get.put(SignupController());
  final Authentication authentication = Get.put(Authentication());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          const BackgroundStyle(
              UpperCircleColor1: Colors.red,
              UpperCircleColor2: Colors.green,
              LowerCircleColor1: Colors.yellow,
              LowerCircleColor2: Colors.blue),
          Container(
            padding: const EdgeInsets.only(top: 30),
            child: Center(
              child: GlossyCard(
                  borderWith: 0.4,
                  height: Get.height * 0.45,
                  width: Get.width * 0.89,
                  borderRadius: 15.0,
                  child: SizedBox(
                      width: Get.width * 0.79,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Referal",
                            style: TextStyle(
                                color: Colors.white70,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            "Do you have Referal Code ?",
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
                                        signupController.referalController,
                                    keyboardType: TextInputType.emailAddress,
                                    autofillHints: const [AutofillHints.email],
                                    validator: (email) => email!.length == 5
                                        ? null
                                        : "Enter a valid referal Code",
                                    style: const TextStyle(
                                        color: Colors.white60,
                                        decoration: TextDecoration.none),
                                    decoration: const InputDecoration(
                                      fillColor: Colors.transparent,
                                      hintText: "Enter the Referal Code",
                                      hintStyle:
                                          TextStyle(color: Colors.white60),
                                      prefixIcon: Icon(
                                        Icons.handshake,
                                        color: Colors.white60,
                                      ),
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
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Obx(() => Text(
                                        authentication.errorMsg!.value,
                                        style:
                                            const TextStyle(color: Colors.red),
                                      )),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      final from = fromKey.currentState!;
                                      if (from.validate()) {
                                        authentication.is_loading.value = true;

                                        signupController.registerUser(
                                            signupController
                                                .emailController.text,
                                            signupController
                                                .passwordController1.text,
                                            signupController
                                                .referalController.text);
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
                                                Colors.blue,
                                                Colors.purple
                                              ]),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      child: const Center(
                                          child: Text(
                                        "Submit",
                                        style: TextStyle(
                                            color: Colors.white60,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 18),
                                      )),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 28,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      authentication.is_loading.value = true;

                                      if (widget.isGoogel) {
                                        authentication.googleSignIn(
                                            signupController
                                                .referalController.text);
                                      } else {
                                        signupController.registerUser(
                                            signupController
                                                .emailController.text,
                                            signupController
                                                .passwordController1.text,
                                            signupController
                                                .referalController.text);
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
                                                Colors.blue
                                              ]),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      child: const Center(
                                          child: Text(
                                        "Don't Have Referal",
                                        style: TextStyle(
                                            color: Colors.white60,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 18),
                                      )),
                                    ),
                                  )
                                ],
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ))),
            ),
          ),
          Obx(
            () => authentication.is_loading.value
                ? Container(
                    color: const Color.fromARGB(39, 158, 158, 158),
                    height: Get.height,
                    width: Get.width,
                    child: const Center(
                        child: CircularProgressIndicator(
                      color: Colors.purple,
                      backgroundColor: Color.fromARGB(255, 9, 113, 198),
                    )),
                  )
                : const Text(""),
          ),
        ],
      ),
    );
  }
}
