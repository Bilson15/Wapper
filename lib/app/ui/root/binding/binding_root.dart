import 'package:get/get.dart';
import 'package:wapper/app/ui/home_page/controller/home_controller.dart';
import 'package:wapper/app/ui/pedidos/controller/historico_pedidos_controller.dart';
import 'package:wapper/app/ui/root/controller/root_controller.dart';
import 'package:wapper/app/ui/search_page.dart/controller/search_controller.dart';
import 'package:wapper/app/ui/user_settings/controller/user_settings.dart';

class RootBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController(), tag: 'home_controller', permanent: true);
    Get.put(RootController(), tag: 'root_controller', permanent: true);
    Get.lazyPut(() => HistoricoPedidoController(), fenix: true, tag: 'historico_controller');
    Get.lazyPut(() => UserSettingsController(), fenix: true, tag: 'user_settings');
    Get.lazyPut(() => SearchController(), fenix: true, tag: 'search_controller');
  }
}
