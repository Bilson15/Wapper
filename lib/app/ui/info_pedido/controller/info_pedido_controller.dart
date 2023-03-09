import 'package:get/get.dart';
import 'package:wapper/app/data/model/pedidoModel.dart';

class InfoPedidoController extends GetxController {
  late final PedidoModel pedido;

  InfoPedidoController({required this.pedido});

  String getStatusPedido() {
    switch (pedido.status) {
      case PedidoStatusEnum.criado:
        return 'agendado';
      case PedidoStatusEnum.finalizado:
        return 'concluído';
      case PedidoStatusEnum.cancelado:
        return 'cancelado';
      default:
        return 'agendado';
    }
  }
}
