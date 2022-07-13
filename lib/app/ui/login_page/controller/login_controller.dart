import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:wapper/app/ui/utils/notificacao.dart';
import 'package:wapper/app/ui/utils/validacao_email.dart';

class LoginController extends GetxController {
  late TextEditingController email = TextEditingController();
  late TextEditingController senha = TextEditingController();
  GlobalKey<FormState> formLoginKey = GlobalKey<FormState>();
  FocusNode nextFocus = FocusNode();
  int controleValidate = 0;
  var visibility = false.obs;

  LoginController();

  @override
  void onInit() {
    super.onInit();
    email.addListener(listenerInputs);
    senha.addListener(listenerInputs);
  }

  listenerInputs() {
    Get.closeAllSnackbars();
    if (controleValidate > 5) {
      formLoginKey.currentState!.validate();
    }
    controleValidate++;
  }

  efetuaLogin() async {
    Get.offAllNamed('/loading');
    await Future.delayed(const Duration(seconds: 5));
    Get.offAllNamed('/root');
  }
}
