import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CadastroClienteController extends GetxController {
  late TextEditingController email = TextEditingController();
  late TextEditingController senha = TextEditingController();
  late TextEditingController emailConfirma = TextEditingController();
  late TextEditingController senhaConfirma = TextEditingController();
  var visibilitySenha = false.obs;
  var visibilitySenhaConfirma = false.obs;

  CadastroClienteController();

  @override
  void onInit() {
    super.onInit();
  }
}
