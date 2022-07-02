import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wapper/app/ui/cadastro/controller/cadastro_cliente_controller.dart';
import 'package:wapper/app/ui/components/button_component.dart';
import 'package:wapper/app/ui/components/text_component.dart';
import 'package:wapper/app/ui/theme/styles.dart';
import 'package:wapper/app/ui/utils/validacao_email.dart';

import '../../components/app_bar_component.dart';
import '../../components/form_field_component.dart';

class CadastroDadosPessoais extends StatelessWidget {
  const CadastroDadosPessoais({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBarComponent(title: 'Cadastro'),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            controller: ScrollController(),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 34, bottom: 35),
                    child: TextComponent(
                      'Dados Pessoais',
                      color: fontColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  InputFormFieldComponent(
                    autofocus: true,
                    hintText: 'Nome Completo',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Este campo é obrigatório!';
                      }
                    },
                    fillColor: lineColor,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: InputFormFieldComponent(
                          autofocus: true,
                          hintText: 'Data Nascimento',
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Este campo é obrigatório!';
                            }
                          },
                          fillColor: lineColor,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: InputFormFieldComponent(
                          autofocus: true,
                          hintText: 'Sexo',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Este campo é obrigatório!';
                            }
                          },
                          fillColor: lineColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  InputFormFieldComponent(
                    autofocus: true,
                    hintText: 'CPF (Opcional)',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Este campo é obrigatório!';
                      }
                    },
                    keyboardType: TextInputType.number,
                    fillColor: lineColor,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: InputFormFieldComponent(
                          autofocus: true,
                          hintText: 'DDD',
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Este campo é obrigatório!';
                            }
                          },
                          fillColor: lineColor,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        flex: 3,
                        child: InputFormFieldComponent(
                          autofocus: true,
                          hintText: 'Telefone',
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Este campo é obrigatório!';
                            }
                          },
                          fillColor: lineColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 34, bottom: 35),
                    child: TextComponent(
                      'Endereço',
                      color: fontColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  InputFormFieldComponent(
                    autofocus: true,
                    hintText: 'CEP',
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Este campo é obrigatório!';
                      }
                    },
                    fillColor: lineColor,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  InputFormFieldComponent(
                    autofocus: true,
                    hintText: 'Endereço',
                    maxLength: 100,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Este campo é obrigatório!';
                      }
                    },
                    fillColor: lineColor,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: InputFormFieldComponent(
                          autofocus: true,
                          hintText: 'Bairro',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Este campo é obrigatório!';
                            }
                          },
                          fillColor: lineColor,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: InputFormFieldComponent(
                          autofocus: true,
                          hintText: 'Número',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Este campo é obrigatório!';
                            }
                          },
                          fillColor: lineColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  InputFormFieldComponent(
                    autofocus: true,
                    hintText: 'Complemento',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Este campo é obrigatório!';
                      }
                    },
                    fillColor: lineColor,
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  SizedBox(
                    width: Get.width * 0.70,
                    child: ButtonComponent(
                      titulo: 'Prosseguir',
                      onPressed: () async {
                        Get.offAllNamed('/loading');
                        await Future.delayed(const Duration(seconds: 5));
                        Get.offAllNamed('/login');
                      },
                      fontColor: fontColor,
                      backgroundColor: amareloPadrao,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
