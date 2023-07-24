import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gamaru_mobile_app/Componants/glossyEffect.dart';
import 'package:get/get.dart';

import '../../Controllers/Login-Contollers/autehntication.dart';
import '../../Controllers/Login-Contollers/signinSignupController.dart';

class OtpPage extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final Authentication authentication = Get.put(Authentication());
  final signupController = Get.put(SignupController());
  final auth = FirebaseAuth.instance;
  final List<FocusNode> _focusNodes = List.generate(6, (index) => FocusNode());
  final List<TextEditingController> _controllers =
      List.generate(6, (index) => TextEditingController());

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _onOtpInputChange(int index) {
    if (_controllers[index].text.isNotEmpty && index < 5) {
      _focusNodes[index].unfocus();
      _focusNodes[index + 1].requestFocus();
    }
  }

  void _verifyOtp() async {
    String enteredOtp = '';
    for (var controller in _controllers) {
      enteredOtp += controller.text;
    }
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: signupController.verificationId, smsCode: enteredOtp);
    try {
      await auth.signInWithCredential(credential).then((value) {
        signupController.registerUser(signupController.emailController.text,
            signupController.passwordController1.text);
      });
    } catch (e) {
      authentication.errorMsgup!.value = "Wrong otp";
    }

    print('Entered OTP: $enteredOtp');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("Assets/BgLogin1.png"), fit: BoxFit.cover)),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: GlossyCard(
                borderWith: 0.4,
                height: Get.height * 0.85,
                width: Get.width * 0.89,
                borderRadius: 15.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Image.asset(
                    //   'Assets/gamaru.png', // Replace this with your logo image
                    //   width: 200,
                    //   height: 200,
                    // ),
                    const SizedBox(height: 5),
                    const Text(
                      'Enter OTP',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'We have sent you an OTP on your mobile number',
                      style: TextStyle(color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        6,
                        (index) => SizedBox(
                          width: 50,
                          height: 60,
                          child: AnimatedBuilder(
                            animation: _focusNodes[index],
                            builder: (context, child) {
                              return Container(
                                child: TextFormField(
                                  controller: _controllers[index],
                                  focusNode: _focusNodes[index],
                                  onChanged: (val) => _onOtpInputChange(index),
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.center,
                                  maxLength: 1,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.zero,
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.blue),
                                    ),
                                    filled: true,
                                    fillColor: _focusNodes[index].hasFocus
                                        ? Colors.blue.withOpacity(0.1)
                                        : Colors.transparent,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Obx(() => Text(
                          authentication.errorMsgup!.value,
                          style: const TextStyle(color: Colors.red),
                        )),
                    const SizedBox(height: 10),
                    InkWell(
                      onTap: _verifyOtp,
                      child: Container(
                        width: Get.width * 0.30,
                        height: 50,
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [Colors.blue, Colors.purple]),
                            borderRadius:
                                BorderRadius.all(Radius.circular(25))),
                        child: const Center(
                          child: Text(
                            'Verify OTP',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
