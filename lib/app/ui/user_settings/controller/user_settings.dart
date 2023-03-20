import 'package:get/get.dart';
import 'package:wapper/app/ui/cart_page/controller/cart_controller.dart';

class UserSettingsController extends GetxController {
  final cartController = Get.find<CartController>(tag: 'cart_controller');
}
