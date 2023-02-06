import 'package:get/get.dart';
import 'package:wapper/app/data/model/empresaModel.dart';
import 'package:wapper/app/data/repository/empresaRepository.dart';
import 'package:wapper/app/ui/utils/mask_formatter.dart';
import 'package:wapper/app/ui/utils/notificacao.dart';

class InfoParceiroController extends GetxController {
  int idEmpresa;
  EmpresaRepository empresaRepository = EmpresaRepository();
  final empresa = Rxn<EmpresaModel>();
  MaskFormatter formatter = MaskFormatter();

  InfoParceiroController({required this.idEmpresa});

  @override
  void onInit() async {
    await buscarEmpresas();
    super.onInit();
  }

  buscarEmpresas() async {
    try {
      empresa.value = await empresaRepository.buscarEmpresa(idEmpresa.toString());
    } catch (e) {
      Notificacao.snackBar(e.toString(), tipoNotificacao: TipoNotificacaoEnum.error);
    }
  }
}
