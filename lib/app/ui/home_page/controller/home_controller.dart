import 'package:get/get.dart';

class HomeController extends GetxController {
  var favorite = false.obs;

  HomeController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print(Get.width);
  }
}
