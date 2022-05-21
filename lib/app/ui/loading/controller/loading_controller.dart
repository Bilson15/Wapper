import 'package:get/get.dart';

class LoadingController extends GetxController {
  var pontinho = ''.obs;
  int count = 1;

  LoadingController();

  @override
  void onInit() async {
    pontinho('.');
    await pontinhos();
    super.onInit();
  }

  pontinhos() async {
    if (count > 3) {
      pontinho('');
      count = 0;
    }
    await Future.delayed(const Duration(milliseconds: 500));
    pontinho(pontinho.value += '.');
    update();
    count++;
    await pontinhos();
  }
}
