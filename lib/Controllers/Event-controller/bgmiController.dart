import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class BgmiController extends GetxController {
  static BgmiController get instance => Get.find();
  final _db = FirebaseFirestore.instance;
  RxList<Map> eventListBgmiUpcoming = <Map>[].obs;

  Future<void> getUpcoming() async {
    await _db
        .collection("BATTLE GROUND MOBILE INDIA")
        .doc("upcoming")
        .get()
        .then((value) {
      eventListBgmiUpcoming = value["events"];
    });
  }
}
