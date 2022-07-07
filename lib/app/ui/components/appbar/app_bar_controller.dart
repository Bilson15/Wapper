import 'package:get/get.dart';

class AppBarController extends GetxController {
  var selecionado = 0.obs;

  AppBarController();

  seleciona(int index) {
    selecionado(index);
    redireciona();
  }

  redireciona() {
    switch (selecionado.value) {
      case 0:
        Get.toNamed('/home');
        break;
      case 1:
        Get.toNamed('/search');
        break;
      default:
    }
  }
}
