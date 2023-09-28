import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:gamaru_mobile_app/Componants/background_style.dart';
import 'package:gamaru_mobile_app/Controllers/ReferalController/referalController.dart';
import 'package:gamaru_mobile_app/Screens/login-singup-screen/referScreen.dart';
import 'package:get/get.dart';
import '../../Componants/glossyEffect.dart';
import '../../Controllers/Login-Contollers/autehntication.dart';
import '../../Controllers/Login-Contollers/signinSignupController.dart';
import 'login_page.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool equalOrnot = true;
  final referalController = Get.put(ReferalController());
  final Authentication authentication = Get.put(Authentication());
  final signupController = Get.put(SignupController());
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
  void dispose() {
    authentication.errorMsgup!.value = "";
    super.dispose();
  }

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
                  height: Get.height * 0.75,
                  width: Get.width * 0.89,
                  borderRadius: 15.0,
                  child: SingleChildScrollView(
                    child: Container(
                        padding: const EdgeInsets.only(top: 15, bottom: 10),
                        width: Get.width * 0.79,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Signup",
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Text(
                              "Just some details to get you in!",
                              style: TextStyle(
                                  color: Colors.white70, fontSize: 16),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Form(
                                key: fromKey,
                                child: Column(
                                  children: [
                                    // TextFormField(
                                    //   controller:
                                    //       signupController.phoneNumberController,
                                    //   keyboardType: TextInputType.phone,
                                    //   validator: (value) => validatePhone(value),
                                    //   style: TextStyle(
                                    //       color: Colors.white60,
                                    //       decoration: TextDecoration.none),
                                    //   decoration: const InputDecoration(
                                    //     fillColor: Colors.transparent,
                                    //     hintText: "Phone no",
                                    //     hintStyle:
                                    //         TextStyle(color: Colors.white60),
                                    //     prefixIcon: Icon(
                                    //       Icons.phone_android,
                                    //       color: Colors.white60,
                                    //     ),
                                    //     enabledBorder: OutlineInputBorder(
                                    //         borderRadius: BorderRadius.all(
                                    //             Radius.circular(10)),
                                    //         borderSide: BorderSide(
                                    //             color: Colors.white60)),
                                    //     errorBorder: OutlineInputBorder(
                                    //         borderRadius: BorderRadius.all(
                                    //             Radius.circular(10)),
                                    //         borderSide:
                                    //             BorderSide(color: Colors.red)),
                                    //     focusedBorder: OutlineInputBorder(
                                    //         borderRadius: BorderRadius.all(
                                    //             Radius.circular(10)),
                                    //         borderSide:
                                    //             BorderSide(color: Colors.purple)),
                                    //   ),
                                    // ),
                                    // SizedBox(
                                    //   height: 15,
                                    // ),
                                    TextFormField(
                                      controller:
                                          signupController.emailController,
                                      keyboardType: TextInputType.emailAddress,
                                      autofillHints: const [
                                        AutofillHints.email
                                      ],
                                      validator: (email) => email != null &&
                                              !EmailValidator.validate(email)
                                          ? "Enter a valid email"
                                          : null,
                                      style: const TextStyle(
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
                                            borderSide: BorderSide(
                                                color: Colors.purple)),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    TextFormField(
                                      controller:
                                          signupController.passwordController1,
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      obscureText: !_isVisible1,
                                      validator: (value) =>
                                          validatePassword(value),
                                      style: const TextStyle(
                                          color: Colors.white60,
                                          decoration: TextDecoration.none),
                                      decoration: InputDecoration(
                                        fillColor: Colors.transparent,
                                        hintText: "password",
                                        hintStyle: const TextStyle(
                                            color: Colors.white60),
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
                                        errorBorder: const OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            borderSide:
                                                BorderSide(color: Colors.red)),
                                        enabledBorder: const OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            borderSide: BorderSide(
                                                color: Colors.white60)),
                                        focusedBorder: const OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            borderSide: BorderSide(
                                                color: Colors.purple)),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    TextFormField(
                                      controller:
                                          signupController.passwordController2,
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      obscureText: !_isVisible2,
                                      validator: (value) =>
                                          validatePassword(value),
                                      style: const TextStyle(
                                          color: Colors.white60,
                                          decoration: TextDecoration.none),
                                      decoration: InputDecoration(
                                        fillColor: Colors.transparent,
                                        hintText: "Confirm password",
                                        hintStyle: const TextStyle(
                                            color: Colors.white60),
                                        prefixIcon: const Icon(
                                          Icons.lock,
                                          color: Colors.white60,
                                        ),
                                        suffixIcon: IconButton(
                                            color: Colors.white60,
                                            onPressed: () => updateStatus2(),
                                            icon: Icon(_isVisible2
                                                ? Icons.visibility
                                                : Icons.visibility_off)),
                                        errorBorder: const OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            borderSide:
                                                BorderSide(color: Colors.red)),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(10)),
                                            borderSide: BorderSide(
                                                color: equalOrnot
                                                    ? Colors.white60
                                                    : Colors.red)),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(10)),
                                            borderSide: BorderSide(
                                                color: equalOrnot
                                                    ? Colors.purple
                                                    : Colors.red)),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Obx(() => Text(
                                          authentication.errorMsgup!.value,
                                          style: const TextStyle(
                                              color: Colors.red),
                                        )),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        final from = fromKey.currentState!;
                                        if (from.validate()) {
                                          if (signupController
                                                  .passwordController1.text ==
                                              signupController
                                                  .passwordController2.text) {
                                            // authentication.is_loading.value =
                                            //     true;

                                            Get.to(() => const Refer(
                                                  isGoogel: false,
                                                ));
                                          } else {
                                            setState(() {
                                              equalOrnot = false;
                                            });
                                          }
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
                                        child: const Center(
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
                            const SizedBox(
                              height: 20,
                            ),
                            Column(children: <Widget>[
                              Row(children: <Widget>[
                                Expanded(
                                  child: Container(
                                      margin: const EdgeInsets.only(
                                          left: 10.0, right: 20.0),
                                      child: const Divider(
                                        color: Colors.white30,
                                        height: 36,
                                      )),
                                ),
                                const Text(
                                  "or",
                                  style: TextStyle(color: Colors.white30),
                                ),
                                Expanded(
                                  child: Container(
                                      margin: const EdgeInsets.only(
                                          left: 20.0, right: 10.0),
                                      child: const Divider(
                                        color: Colors.white30,
                                        height: 36,
                                      )),
                                ),
                              ]),
                            ]),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: [
                            //     InkWell(
                            //       onTap: () {
                            //         // authentication.is_loading.value = true;
                            //         // Get.to(() => const Refer(isGoogel: true));
                            //       },
                            //       child: GlossyCard(
                            //         height: 50.0,
                            //         width: 50.0,
                            //         borderRadius: 15.0,
                            //         borderWith: 1.1,
                            //         child: Container(
                            //           height: 30,
                            //           width: 30,
                            //           decoration: const BoxDecoration(
                            //               image: DecorationImage(
                            //                   image: AssetImage(
                            //                       "Assets/googleLogo.png"))),
                            //         ),
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Already have account ?",
                                  style: TextStyle(color: Colors.white60),
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.off(const Login(),
                                        transition: Transition.cupertinoDialog);
                                  },
                                  child: const Text(
                                    "  Login",
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            SizedBox(
                              width: Get.width * 0.79,
                              child: const Row(
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
  if (pass.length > 10) {
    return "wrong number please check!";
  }

  return null;
}
