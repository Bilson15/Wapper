import 'package:get/get.dart';
import 'package:wapper/app/data/model/pageModel.dart';
import 'package:wapper/app/data/model/pedidoModel.dart';
import 'package:wapper/app/data/repository/pedidoRepository.dart';
import 'package:wapper/app/ui/cart_page/controller/cart_controller.dart';
import 'package:wapper/app/ui/utils/notificacao.dart';

class HistoricoPedidoController extends GetxController {
  RxList<PedidoModel> listPedido = <PedidoModel>[].obs;
  PedidoRepository pedidoRepository = PedidoRepository();
  CartController cartController = Get.find<CartController>(tag: 'cart_controller');
  PageModel pagina = PageModel();
  RxBool loading = RxBool(false);

  @override
  void onInit() async {
    await buscarPedidos();
    super.onInit();
  }

  buscarPedidos() async {
    try {
      loading(true);
      List retorno = await pedidoRepository.buscarPedidosCliente(
        pagina.pageNumber,
        cartController.clienteLogado.value?.idCliente ?? 0,
      );
      await Future.delayed(Duration(seconds: 1));
      listPedido.addAll(retorno[0]);
      pagina = retorno[1];
    } catch (e) {
      Notificacao.snackBar(e.toString(), tipoNotificacao: TipoNotificacaoEnum.error);
    } finally {
      loading(false);
      listPedido.refresh();
    }
  }

  loadMore() async {
    if (!pagina.isEmpty) {
      pagina.more();
      await buscarPedidos();
    }
  }
}
