import 'package:get/get.dart';
import 'package:wapper/app/data/model/profissionalModel.dart';

import 'package:wapper/app/data/model/servicoModel.dart';

class ServiceParceiroController extends GetxController {
  final ServicoModel servico;
  final profissionalSelecionado = Rxn<ProfissionalModel>();

  ServiceParceiroController({required this.servico});

  @override
  void onInit() async {
    super.onInit();
  }

  void selecionarProfissional(ProfissionalModel profissional) {
    profissionalSelecionado.value = profissional;
  }
}
