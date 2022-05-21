import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  var carregando = false.obs;

  @override
  void onInit() async {
    await redireciona();
    super.onInit();
  }

  redireciona() async {
    try {
      carregando(true);
      await Future.delayed(const Duration(seconds: 5));
    } catch (e) {
      e.toString();
    } finally {
      carregando(false);
      Get.offAllNamed('/login');
    }
  }
}
