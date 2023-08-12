import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class BgmiController extends GetxController {
  static BgmiController get instance => Get.find();
  final _db = FirebaseFirestore.instance;
  RxList eventListBgmiUpcoming = [].obs;
  RxBool upcoming_loading = true.obs;

  Future<void> getUpcoming() async {
    await _db
        .collection("BATTLE GROUND MOBILE INDIA")
        .doc("upcoming")
        .get()
        .then((value) {
      eventListBgmiUpcoming.value = value["events"];
      upcoming_loading.value = false;
    });
  }
}
