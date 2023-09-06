import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:gamaru_mobile_app/Componants/glossyEffect.dart';
import 'package:gamaru_mobile_app/Controllers/Login-Contollers/autehntication.dart';
import 'package:gamaru_mobile_app/Controllers/Login-Contollers/signinSignupController.dart';
import 'package:gamaru_mobile_app/Controllers/ReferalController/referalController.dart';
import 'package:gamaru_mobile_app/Screens/login-singup-screen/forget_password_page.dart';
import 'package:gamaru_mobile_app/Screens/login-singup-screen/signup_page.dart';
import 'package:gamaru_mobile_app/Screens/refer_screen/refer_earn_screen.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final signupController = Get.put(SignupController());
  final Authentication authentication = Get.put(Authentication());
  bool _isVisible1 = false;
  final fromKey = GlobalKey<FormState>();
  void updateStatus1() {
    setState(() {
      _isVisible1 = !_isVisible1;
    });
  }

  @override
  void dispose() {
    authentication.errorMsg!.value = "";
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("Assets/BgLogin1.png"),
                    fit: BoxFit.cover)),
            child: Container(
              padding: const EdgeInsets.only(top: 30),
              child: Center(
                child: GlossyCard(
                    borderWith: 0.4,
                    height: Get.height * 0.75,
                    width: Get.width * 0.89,
                    borderRadius: 15.0,
                    child: SizedBox(
                        width: Get.width * 0.79,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Login",
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Text(
                              "Glad you're back!",
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
                                        hintText: "Enter your Email",
                                        hintStyle:
                                            TextStyle(color: Colors.white60),
                                        prefixIcon: Icon(
                                          Icons.email_rounded,
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
                                        hintText: "Enter your password",
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
                                        enabledBorder: const OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            borderSide: BorderSide(
                                                color: Colors.white60)),
                                        errorBorder: const OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            borderSide:
                                                BorderSide(color: Colors.red)),
                                        focusedBorder: const OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            borderSide: BorderSide(
                                                color: Colors.purple)),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Obx(() => Text(
                                          authentication.errorMsg!.value,
                                          style: const TextStyle(
                                              color: Colors.red),
                                        )),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        final from = fromKey.currentState!;
                                        if (from.validate()) {
                                          authentication.is_loading.value =
                                              true;
                                          signupController.loginUser(
                                              signupController
                                                  .emailController.text,
                                              signupController
                                                  .passwordController1.text);
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
                                          "Login",
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
                            InkWell(
                              onTap: () {
                                Get.off(const ForgetPass(),
                                    transition: Transition.cupertinoDialog);
                              },
                              child: Center(
                                  child: Text(
                                "Forgot password ?",
                                style: TextStyle(color: Colors.blue),
                              )),
                            ),
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
                            //         // authentication.googleSignIn(signupController
                            //         //     .referalController.text);
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
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Don't have account ?",
                                  style: TextStyle(color: Colors.white60),
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.off(
                                      const SignUp(),
                                      transition: Transition.cupertinoDialog,
                                    );
                                  },
                                  child: const Text(
                                    "  Signup",
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
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
                        ))),
              ),
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
