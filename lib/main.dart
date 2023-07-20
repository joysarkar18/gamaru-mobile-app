import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gamaru_mobile_app/Screens/home.dart';
import 'package:gamaru_mobile_app/Screens/login_page.dart';
import 'package:gamaru_mobile_app/Screens/signup_page.dart';
import 'package:get/get.dart';

import 'Controllers/Login-Contollers/autehntication.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) => Get.put(Authentication()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Login(),
    );
  }
}
