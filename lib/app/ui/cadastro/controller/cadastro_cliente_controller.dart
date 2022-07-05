import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CadastroClienteController extends GetxController {
  late TextEditingController email = TextEditingController();
  late TextEditingController senha = TextEditingController();
  late TextEditingController emailConfirma = TextEditingController();
  late TextEditingController senhaConfirma = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  FocusNode nextEmailConfirm = FocusNode();
  FocusNode nextSenha = FocusNode();
  FocusNode nextSenhaConfirm = FocusNode();
  var visibilitySenha = false.obs;
  var visibilitySenhaConfirma = false.obs;

  CadastroClienteController();

  @override
  void onInit() {
    email.addListener(validaForm);
    emailConfirma.addListener(validaForm);
    senha.addListener(validaForm);
    senhaConfirma.addListener(validaForm);
    super.onInit();
  }

  validaForm() {
    formKey.currentState!.validate();
  }
}
