import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wapper/app/ui/cadastro/controller/cadastro_cliente_controller.dart';
import 'package:wapper/app/ui/components/button_component.dart';
import 'package:wapper/app/ui/components/text_component.dart';
import 'package:wapper/app/ui/theme/styles.dart';
import 'package:wapper/app/ui/utils/validacao_email.dart';

import '../../components/app_bar_component.dart';
import '../../components/form_field_component.dart';

class CadastroCliente extends StatelessWidget {
  const CadastroCliente({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CadastroClienteController>();
    return Material(
      child: Scaffold(
        appBar: AppBarComponent(
          textComponent: const TextComponent(
            'Cadastro',
            fontWeight: FontWeight.bold,
            fontFamily: 'OleoScript',
            fontSize: 25,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            controller: ScrollController(initialScrollOffset: 0),
            child: Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 34),
                    child: TextComponent(
                      'Dados de Login',
                      color: fontColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  InputFormFieldComponent(
                    controller: controller.email,
                    hintText: 'E-mail',
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'E-mail é obrigatório!';
                      }
                      if (!ValidacaoEmail.validarEmail(value)) {
                        return 'E-mail inválido';
                      }
                    },
                    fillColor: lineColor,
                  ),
                  const SizedBox(
                    height: 21,
                  ),
                  InputFormFieldComponent(
                    controller: controller.emailConfirma,
                    hintText: 'Confirmar E-mail',
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'E-mail de confirmação é obrigatório!';
                      }
                      if (controller.email.text.compareTo(value) != 0) {
                        return 'E-mail informado está diferente';
                      }
                    },
                    fillColor: lineColor,
                  ),
                  const SizedBox(
                    height: 21,
                  ),
                  Obx(
                    () => InputFormFieldComponent(
                      controller: controller.senha,
                      hintText: 'Senha',
                      fillColor: lineColor,
                      obscureText: !controller.visibilitySenha.value,
                      textInputAction: TextInputAction.next,
                      suffixIcon: GestureDetector(
                        onTap: () => controller.visibilitySenha(!controller.visibilitySenha.value),
                        child: Icon(
                          !controller.visibilitySenha.value ? Icons.visibility : Icons.visibility_off,
                          color: cinzaPadrao,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Senha é obrigatório!';
                        }
                      },
                      maxLength: 25,
                    ),
                  ),
                  const SizedBox(
                    height: 21,
                  ),
                  Obx(
                    () => InputFormFieldComponent(
                      controller: controller.senhaConfirma,
                      hintText: 'Confirmar Senha',
                      obscureText: !controller.visibilitySenhaConfirma.value,
                      textInputAction: TextInputAction.done,
                      onFieldSubmitted: (value) {
                        controller.formKey.currentState!.validate();
                      },
                      suffixIcon: GestureDetector(
                        onTap: () => controller.visibilitySenhaConfirma(!controller.visibilitySenhaConfirma.value),
                        child: Icon(
                          !controller.visibilitySenhaConfirma.value ? Icons.visibility : Icons.visibility_off,
                          color: cinzaPadrao,
                        ),
                      ),
                      fillColor: lineColor,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Senha de confirmação é obrigatório!';
                        }
                        if (controller.senhaConfirma.text.compareTo(value) != 0) {
                          return 'Senha informada está diferente';
                        }
                      },
                      maxLength: 25,
                    ),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  SizedBox(
                    width: Get.width * 0.70,
                    child: ButtonComponent(
                      titulo: 'Prosseguir',
                      onPressed: () {
                        if (controller.formKey.currentState!.validate()) {
                          Get.toNamed('/cadastro-dados-pessoais');
                        }
                      },
                      fontColor: fontColor,
                      backgroundColor: amareloPadrao,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
