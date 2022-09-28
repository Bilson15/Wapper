import 'package:get/get.dart';
import 'package:wapper/app/data/model/empresaModel.dart';
import 'package:wapper/app/data/repository/empresaRepository.dart';
import 'package:wapper/app/ui/utils/notificacao.dart';

class InfoParceiroController extends GetxController {
  late int idEmpresa;
  late EmpresaRepository empresaRepository = EmpresaRepository();
  late EmpresaModel empresa;

  InfoParceiroController(int idEmpresa) {
    this.idEmpresa = idEmpresa;
  }

  @override
  void onInit() async {
    await buscarEmpresas();
    print(empresa.id);
    super.onInit();
  }

  buscarEmpresas() async {
    try {
      empresa = await empresaRepository.buscarEmpresa(idEmpresa.toString());
      await Future.delayed(Duration(seconds: 1));
    } catch (e) {
      Notificacao.snackBar(e.toString(), tipoNotificacao: TipoNotificacaoEnum.error);
    }
  }
}
