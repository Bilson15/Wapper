import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wapper/app/ui/utils/mask_formatter.dart';

class CadastroDadosPessoaisController extends GetxController {
  late TextEditingController nome = TextEditingController();
  late TextEditingController dataNasc = TextEditingController();
  late TextEditingController sexo = TextEditingController();
  late TextEditingController cpf = TextEditingController();
  late TextEditingController ddd = TextEditingController();
  late TextEditingController telefone = TextEditingController();
  late TextEditingController cep = TextEditingController();
  late TextEditingController endereco = TextEditingController();
  late TextEditingController bairro = TextEditingController();
  late TextEditingController numero = TextEditingController();
  late TextEditingController complemento = TextEditingController();

  List<String> dropdownlist = ['Masculino', 'Feminino', 'Não informar'];

  MaskFormatter maskFormatter = MaskFormatter();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  FocusNode nextDataNasc = FocusNode();
  FocusNode nextSexo = FocusNode();
  FocusNode nextCpf = FocusNode();
  FocusNode nextddd = FocusNode();
  FocusNode nextTelefone = FocusNode();
  FocusNode nextCep = FocusNode();
  FocusNode nextEndereco = FocusNode();
  FocusNode nextBairro = FocusNode();
  FocusNode nextNumero = FocusNode();
  FocusNode nextComplemento = FocusNode();
  var visibilitySenha = false.obs;
  var visibilitySenhaConfirma = false.obs;

  CadastroDadosPessoaisController();

  @override
  void onInit() {
    nome.addListener(validaForm);
    dataNasc.addListener(validaForm);
    sexo.addListener(validaForm);
    ddd.addListener(validaForm);
    telefone.addListener(validaForm);
    cep.addListener(validaForm);
    endereco.addListener(validaForm);
    bairro.addListener(validaForm);
    numero.addListener(validaForm);
    complemento.addListener(validaForm);

    super.onInit();
  }

  validaForm() {
    formKey.currentState!.validate();
  }
}
