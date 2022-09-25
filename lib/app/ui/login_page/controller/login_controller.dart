import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:wapper/app/data/model/clienteModel.dart';
import 'package:wapper/app/data/model/loginModel.dart';
import 'package:wapper/app/data/repository/ClienteRepository.dart';
import 'package:wapper/app/ui/utils/notificacao.dart';

class LoginController extends GetxController {
  late TextEditingController email = TextEditingController();
  late TextEditingController senha = TextEditingController();
  GlobalKey<FormState> formLoginKey = GlobalKey<FormState>();
  ClienteRepository clienteRepository = ClienteRepository();
  late ClienteModel cliente;
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
    try {
      Get.offAllNamed('/loading');

      LoginModel loginModel = LoginModel(email: email.text, senha: senha.text);
      cliente = await clienteRepository.login(loginModel);
      if (cliente.idCliente != null) {
        Get.offAllNamed('/root/0');
      } else {
        Notificacao.snackBar('Ocorreu um erro, tente novamente', tipoNotificacao: TipoNotificacaoEnum.error);
      }
    } catch (e) {
      Notificacao.snackBar(e.toString(), tipoNotificacao: TipoNotificacaoEnum.error);
      Get.offAllNamed('/login');
    } finally {}
  }
}
