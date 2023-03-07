import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:wapper/app/data/model/clienteModel.dart';
import 'package:wapper/app/data/model/itemPedido.dart';
import 'package:wapper/app/data/model/pedidoModel.dart';
import 'package:wapper/app/data/repository/pedidoRepository.dart';
import 'package:wapper/app/ui/info_pedido/view/info_pedido.dart';
import 'package:wapper/app/ui/utils/mask_formatter.dart';
import 'package:wapper/app/ui/utils/notificacao.dart';

class CartController extends GetxController {
  Rxn<PaymentForm> selectedPaymentForm = Rxn<PaymentForm>();
  Rxn<ClienteModel> clienteLogado = Rxn<ClienteModel>();
  final MaskFormatter formatter = MaskFormatter();
  Rxn<PedidoModel> pedido = Rxn<PedidoModel>();
  PedidoRepository pedidoRepository = PedidoRepository();

  double subtotal() {
    double valor = 0;
    for (final ItemPedidoModel item in pedido.value?.itemsPedido ?? []) {
      valor += item.valorItem;
    }
    return valor;
  }

  Future<void> criarPedido() async {
    if (pedido.value != null) {
      log(jsonEncode(pedido.toJson()));
      try {
        PedidoModel pedidoCriado = await pedidoRepository.criarPedido(pedido.value!);

        if (pedidoCriado.idPedido != null) {
          Get.close(3);
          Get.to(InfoPedido());
        }
      } catch (e) {
        Notificacao.snackBar(e.toString());
      }
    }
  }
}

class PaymentForm {
  int? id;
  String? title;
  PaymentForm({
    this.id,
    this.title = '',
  });
}
