import 'package:get/get.dart';

class MainController extends GetxController {
  static MainController get instance => Get.find();
  RxInt navBarIndex = 1.obs;
}
