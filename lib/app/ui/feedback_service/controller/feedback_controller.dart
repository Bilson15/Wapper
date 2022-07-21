import 'package:get/get.dart';

class FeedBackController extends GetxController {
  var starsParceiro = 1.0.obs;
  var starsProfissional = 1.0.obs;

  @override
  void onInit() {
    initStars();
    super.onInit();
  }

  initStars() async {
    await Future.delayed(Duration(milliseconds: 500));
    starsParceiro(starsParceiro.value + 1.0);
    starsProfissional(starsProfissional.value + 1.0);
    if (starsParceiro.value > 5.0) return;
    if (starsProfissional.value > 5.0) return;
    initStars();
  }
}
