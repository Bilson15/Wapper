import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wapper/app/ui/cadastro/controller/cadastro_dados_pessoais_controller.dart';
import 'package:wapper/app/ui/components/button_component.dart';
import 'package:wapper/app/ui/components/text_component.dart';
import 'package:wapper/app/ui/theme/styles.dart';
import '../../components/app_bar_component.dart';
import '../../components/form_field_component.dart';

class CadastroDadosPessoais extends StatelessWidget {
  const CadastroDadosPessoais({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final controller = Get.find<CadastroDadosPessoaisController>();
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
            controller: ScrollController(),
            child: Form(
              key: controller.formKey,
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
                    controller: controller.nome,
                    hintText: 'Nome Completo',
                    validator: (value) {
                      if (value == null || value.isEmpty) return 'Este campo é obrigatório!';
                    },
                    maxLength: 80,
                    fillColor: lineColor,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: InputFormFieldComponent(
                          controller: controller.dataNasc,
                          hintText: 'Data Nascimento',
                          inputFormatter: [controller.maskFormatter.dataFormatter()],
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) return 'Este campo é obrigatório!';

                            if ((controller.tratarString(value)?.length ?? 0) < 8) return 'Data inválida';
                          },
                          textInputAction: TextInputAction.next,
                          fillColor: lineColor,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: DropdownSearch(
                          mode: Mode.MENU,
                          showSearchBox: false,
                          items: controller.dropdownlist,
                          selectedItem: 'Gênero',

                          onChanged: (value) {
                            controller.sexo.text = value.toString();

                            FocusScope.of(context).requestFocus(controller.nextCpf);
                          },
                          maxHeight: 115,
                          popupItemBuilder: (context, value, verdadeiro) {
                            return Container(
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.symmetric(vertical: 8),
                                    child: Text(
                                      value.toString(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: cinzaPadrao),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          dropdownBuilder: (context, value) {
                            return Text(
                              value.toString(),
                              style: TextStyle(
                                  color: cinzaPadrao,
                                  fontSize: 16 * media.textScaleFactor,
                                  letterSpacing: 0.15,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w500),
                            );
                          },
                          validator: (value) {
                            if (controller.sexo.text.toString().isEmpty) return 'Este campo é obrigatório!';
                          },

                          dropdownSearchBaseStyle: TextStyle(
                            color: fontColor,
                          ),
                          dropdownSearchDecoration: InputDecoration(
                            isDense: true,
                            fillColor: lineColor,
                            filled: true,
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: BorderSide.none,
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: BorderSide.none,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),

                          dropDownButton: Icon(
                            Icons.expand_more_rounded,
                            color: fontColor,
                          ),
                          popupBackgroundColor: lineColor, // Cor de fundo para caixa de seleção
                          showAsSuffixIcons: true,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  InputFormFieldComponent(
                    controller: controller.cpf,
                    focusNode: controller.nextCpf,
                    textInputAction: TextInputAction.next,
                    inputFormatter: [controller.maskFormatter.cpfFormatter()],
                    hintText: 'CPF (Opcional)',
                    validator: (value) {
                      if ((controller.tratarString(value)?.length ?? 0) < 11) return 'CPF inválido';
                    },
                    keyboardType: TextInputType.number,
                    fillColor: lineColor,
                    maxLength: 14,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  InputFormFieldComponent(
                    controller: controller.telefone,
                    textInputAction: TextInputAction.next,
                    hintText: 'Telefone',
                    inputFormatter: [controller.maskFormatter.telefoneInputFormmater()],
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) return 'Este campo é obrigatório!';

                      if ((controller.tratarString(value)?.length ?? 0) < 11) return 'Telefone inválido';
                    },
                    maxLength: 15,
                    fillColor: lineColor,
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
                    controller: controller.cep,
                    textInputAction: TextInputAction.next,
                    hintText: 'CEP',
                    inputFormatter: [controller.maskFormatter.cepInputFormmater()],
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) return 'Este campo é obrigatório!';

                      if ((controller.tratarString(value)?.length ?? 0) < 8) return 'CEP inválido';
                    },
                    fillColor: lineColor,
                    maxLength: 9,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  InputFormFieldComponent(
                    controller: controller.endereco,
                    textInputAction: TextInputAction.next,
                    hintText: 'Endereço',
                    maxLength: 100,
                    validator: (value) {
                      if (value == null || value.isEmpty) return 'Este campo é obrigatório!';
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
                          controller: controller.bairro,
                          textInputAction: TextInputAction.next,
                          hintText: 'Bairro',
                          validator: (value) {
                            if (value == null || value.isEmpty) return 'Este campo é obrigatório!';
                          },
                          fillColor: lineColor,
                          maxLength: 35,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: InputFormFieldComponent(
                          controller: controller.numero,
                          textInputAction: TextInputAction.next,
                          hintText: 'Número',
                          validator: (value) {
                            if (value == null || value.isEmpty) return 'Este campo é obrigatório!';
                          },
                          maxLength: 10,
                          fillColor: lineColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  InputFormFieldComponent(
                    controller: controller.complemento,
                    textInputAction: TextInputAction.done,
                    onFieldSubmitted: (value) {
                      controller.formKey.currentState!.validate();
                    },
                    hintText: 'Complemento (Opcional)',
                    maxLength: 80,
                    fillColor: lineColor,
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  SizedBox(
                    width: Get.width * 0.70,
                    child: ButtonComponent(
                      titulo: 'Finalizar cadastro',
                      onPressed: () async {
                        if (controller.formKey.currentState!.validate()) await controller.finalizarCadastro();
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
