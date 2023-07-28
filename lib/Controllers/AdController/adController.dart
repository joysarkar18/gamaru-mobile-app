import 'package:get/get.dart';

class AdController extends GetxController {
  static AdController get instance => Get.find();
  RxBool ad_isLoading = false.obs;
}
