import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:wapper/app/ui/utils/notificacao.dart';
import 'package:wapper/app/ui/utils/validacao_email.dart';

class LoginController extends GetxController {
  late TextEditingController email = TextEditingController();
  late TextEditingController senha = TextEditingController();
  GlobalKey<FormState> formLoginKey = GlobalKey<FormState>();
  FocusNode nextFocus = FocusNode();
  var visibility = false.obs;

  LoginController();

  @override
  void onInit() {
    email.addListener(() {
      Get.closeAllSnackbars();
    });
    senha.addListener(() {
      Get.closeAllSnackbars();
    });

    super.onInit();
  }

  validaLogin() async {
    if (email.text.isEmpty && senha.text.isEmpty) {
      Notificacao.snackBar('Você não informou Email e Senha, informe para prosseguir!');
    } else if (email.text.isNotEmpty && senha.text.isEmpty) {
      Notificacao.snackBar('Você não informou o Senha, informe para prosseguir!');
    } else if (email.text.isEmpty && senha.text.isNotEmpty) {
      Notificacao.snackBar('Você não informou o Email, informe para prosseguir!');
    } else {
      ValidacaoEmail.validarEmail(email.text)
          ? await efetuaLogin()
          : Notificacao.snackBar('Email inválido, tente novamente!', tipoNotificacao: TipoNotificacaoEnum.error);
    }
  }

  efetuaLogin() async {
    Get.offAllNamed('/loading');
    await Future.delayed(const Duration(seconds: 5));
    Get.offAllNamed('/home');
  }
}
