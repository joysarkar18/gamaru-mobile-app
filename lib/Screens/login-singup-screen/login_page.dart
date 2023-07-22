import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:gamaru_mobile_app/Componants/glossyEffect.dart';
import 'package:gamaru_mobile_app/Controllers/Login-Contollers/autehntication.dart';
import 'package:gamaru_mobile_app/Controllers/Login-Contollers/signinSignupController.dart';
import 'package:gamaru_mobile_app/Screens/home.dart';
import 'package:gamaru_mobile_app/Screens/login-singup-screen/signup_page.dart';
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
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("Assets/BgLogin1.png"), fit: BoxFit.cover)),
        child: Container(
          padding: EdgeInsets.only(top: 30),
          child: Center(
            child: GlossyCard(
                borderWith: 0.4,
                height: Get.height * 0.75,
                width: Get.width * 0.89,
                borderRadius: 15.0,
                child: Container(
                    width: Get.width * 0.79,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.white70,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Glad you're back!",
                          style: TextStyle(color: Colors.white70, fontSize: 16),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Form(
                            key: fromKey,
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: signupController.emailController,
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
                                    hintText: "Enter your Email",
                                    hintStyle: TextStyle(color: Colors.white60),
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
                                        borderSide:
                                            BorderSide(color: Colors.white60)),
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
                                  validator: (value) => validatePassword(value),
                                  style: TextStyle(
                                      color: Colors.white60,
                                      decoration: TextDecoration.none),
                                  decoration: InputDecoration(
                                    fillColor: Colors.transparent,
                                    hintText: "Enter your psaaword",
                                    hintStyle: TextStyle(color: Colors.white60),
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
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        borderSide:
                                            BorderSide(color: Colors.white60)),
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
                                  height: 10,
                                ),
                                Obx(() => Text(
                                      authentication.errorMsg!.value,
                                      style: TextStyle(color: Colors.red),
                                    )),
                                SizedBox(
                                  height: 5,
                                ),
                                InkWell(
                                  onTap: () {
                                    final from = fromKey.currentState!;
                                    if (from.validate()) {
                                      signupController.loginUser(
                                          signupController.emailController.text,
                                          signupController
                                              .passwordController1.text);
                                      print("sign up complete");
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
                                    child: Center(
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
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          child: Center(
                              child: Text(
                            "Forgot password ?",
                            style: TextStyle(color: Colors.blue),
                          )),
                        ),
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
                              onTap: () {
                                Get.off(
                                  SignUp(),
                                  transition: Transition.leftToRight,
                                );
                              },
                              child: Text(
                                "  Signup",
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

String? validatePassword(String? pass) {
  if (pass == null || pass.isEmpty) {
    return "please enter the password";
  }

  if (pass.length < 5) {
    return "password can't be to short";
  }

  return null;
}
