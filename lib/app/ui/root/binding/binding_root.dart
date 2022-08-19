import 'package:get/get.dart';
import 'package:wapper/app/ui/home_page/controller/home_controller.dart';
import 'package:wapper/app/ui/root/controller/root_controller.dart';

class RootBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController(), tag: 'home_controller', permanent: true);
    Get.put(RootController(), tag: 'root_controller', permanent: true);
  }
}
