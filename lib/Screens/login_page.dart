import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:gamaru_mobile_app/Screens/signup_page.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.blue[100],
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF3F5BFA),
                Colors.white,
                Color(0xFF3F5BFA),
              ],
            ),
          ),
          width: 400,
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 250, top: 55),
                child: Text(
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                  ),
                  "Login",
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 210,
                  top: 4,
                ),
                child: Text(
                  style: TextStyle(
                    // fontSize: 30,
                    color: Colors.black,
                  ),
                  "Glad you're back.!",
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                      20,
                    ),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      border: InputBorder.none,
                      hintText: "Username",
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                      20,
                    ),
                  ),
                  child: TextField(
                    obscureText: true,
                    obscuringCharacter: "*",
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10),
                      border: InputBorder.none,
                      hintText: "Password",
                      suffixIcon: IconButton(
                          onPressed: () {}, icon: Icon(Icons.visibility)),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Checkbox(
                    value: isBlank,
                    onChanged: (value) {},
                  ),
                  Text(
                    "Remember me",
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
              FloatingActionButton(
                onPressed: () {},
                child: Text("Login"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {},
                  child: Text(
                    "Forgot Password ?",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
              SizedBox(
                height: 265,
              ),
              Container(
                margin: EdgeInsets.only(top: Get.height - 820),
                child: Row(
                  children: [
                    SizedBox(
                      width: Get.width / 5,
                    ),
                    Text(
                      style: TextStyle(),
                      "Don't have an account?",
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => SignUp());
                      },
                      child: Text(
                        "Signup",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 106, 255, 0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
