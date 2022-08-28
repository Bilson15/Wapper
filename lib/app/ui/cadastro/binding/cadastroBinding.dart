import 'package:get/get.dart';
import 'package:wapper/app/ui/cadastro/controller/cadastro_cliente_controller.dart';
import 'package:wapper/app/ui/cadastro/controller/cadastro_dados_pessoais_controller.dart';

class CadastroBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CadastroClienteController(), fenix: true);
    Get.lazyPut(() => CadastroDadosPessoaisController(), fenix: true);
  }
}
