import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:wapper/app/data/model/clienteModel.dart';
import 'package:wapper/app/data/model/enderecoModel.dart';
import 'package:wapper/app/data/model/telefoneClienteModel.dart';
import 'package:wapper/app/data/repository/ClienteRepository.dart';
import 'package:wapper/app/ui/cadastro/controller/cadastro_cliente_controller.dart';
import 'package:wapper/app/ui/loading/view/loading_view.dart';
import 'package:wapper/app/ui/utils/mask_formatter.dart';
import 'package:wapper/app/ui/utils/notificacao.dart';

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
  final controllerCadastroCliente = Get.find<CadastroClienteController>();
  final ClienteRepository repository = ClienteRepository();

  List<String> dropdownlist = ['Masculino', 'Feminino', 'Não informar'];

  MaskFormatter maskFormatter = MaskFormatter();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  FocusNode nextCpf = FocusNode();

  var visibilitySenha = false.obs;
  var visibilitySenhaConfirma = false.obs;

  CadastroDadosPessoaisController();

  @override
  void onInit() {
    super.onInit();
  }

  finalizarCadastro() async {
    try {
      Get.offNamedUntil(
        '/loading',
        (route) => LoadingView() == LoadingView(),
      );
      ClienteModel cliente = criarModelo();
      await criarCliente(cliente);
    } catch (e) {
      Notificacao.snackBar(e.toString());
      Get.toNamed('/cadastro-dados-pessoais');
    }
  }

  ClienteModel criarModelo() {
    return ClienteModel(
      email: controllerCadastroCliente.email.text,
      senha: controllerCadastroCliente.senha.text,
      cpf: tratarString(cpf.text),
      nome: nome.text,
      sexo: sexo.text,
      statusCliente: Status.ATIVO,
      dataNascimento: DateFormat("dd-MM-yyyyy").parse(dataNasc.text.replaceAll('/', '-')).toString().split(' ').first,
      endereco: [
        EnderecoModel(
          cep: int.parse(tratarString(cep.text) ?? '00000000'),
          complemento: complemento.text,
          logradouro: endereco.text,
          numero: numero.text,
          bairro: bairro.text,
          statusEndereco: Status.ATIVO,
        ),
      ],
      telefoneCliente: [
        TelefoneClienteModel(
            ddd: int.parse(telefone.text.substring(1, 3)),
            telefone: int.parse(tratarString(telefone.text.substring(4)) ?? '999999999'),
            statusTelefone: Status.ATIVO)
      ],
    );
  }

  String? tratarString(String? line) {
    return line
            ?.replaceAll('-', '')
            .replaceAll('/', '')
            .replaceAll('.', '')
            .replaceAll('(', '')
            .replaceAll(')', '')
            .replaceAll(' ', '') ??
        '';
  }

  criarCliente(ClienteModel cliente) async {
    try {
      ClienteModel clienteRepo = await repository.criarCliente(cliente);
      if (clienteRepo.idCliente != null) {
        Get.offAllNamed('/login');
      } else {
        Get.toNamed('/cadastro-dados-pessoais');
      }
    } catch (e) {
      throw e;
    }
  }
}
