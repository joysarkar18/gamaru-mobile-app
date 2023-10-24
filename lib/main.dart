import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:gamaru_mobile_app/Screens/Home-Screen/homeScreen.dart';
import 'package:gamaru_mobile_app/Screens/Home-Screen/home_shimmer.dart';
import 'package:gamaru_mobile_app/Screens/navigation_bar.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:permission_handler/permission_handler.dart';

import 'Controllers/Login-Contollers/autehntication.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((_) => Get.put(Authentication()));
  await Permission.notification.isDenied.then((value) {
    if (value) {
      Permission.notification.request();
    }
  });
  final fcmTocken = await FirebaseMessaging.instance.getToken().then(
    (value) {
      print(
          'token kfghfghfhghjgjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj   = ' +
              value.toString());
    },
  );

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
      home: const HomeShimmer(),
    );
  }
}
