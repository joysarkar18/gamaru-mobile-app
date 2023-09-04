// ignore: file_names
import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:get/get.dart';

class ReferalController extends GetxController {
  static ReferalController get instance => Get.find();

  String generateUniqueString(String input) {
    // Calculate a hash of the input string using SHA-256
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);

    // Take the first 5 characters of the hexadecimal digest
    final hash = digest.toString().substring(0, 5);
    print("ansssssssssssssssssssssssssssssssssssssssssssssssssssssss" + hash);

    return hash;
  }
}
