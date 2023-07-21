import 'package:flutter/material.dart';
import 'package:gamaru_mobile_app/Componants/glossyEffect.dart';
import 'package:get/get.dart';

class OtpPage extends StatefulWidget {
  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
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

  void _verifyOtp() {
    String enteredOtp = '';
    for (var controller in _controllers) {
      enteredOtp += controller.text;
    }
    // Implement your OTP verification logic here
    // For simplicity, we will just print the entered OTP for now.
    print('Entered OTP: $enteredOtp');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
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
                    SizedBox(height: 5),
                    Text(
                      'Enter OTP',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'We have sent you an OTP on your mobile number',
                      style: TextStyle(color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        4,
                        (index) => SizedBox(
                          width: 60,
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
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.zero,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                    ),
                                    focusedBorder: OutlineInputBorder(
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
                    SizedBox(height: 20),
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
                        child: Center(
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
