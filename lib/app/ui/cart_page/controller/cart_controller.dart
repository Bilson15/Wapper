import 'package:get/get.dart';
import 'package:wapper/app/data/model/clienteModel.dart';
import 'package:wapper/app/data/model/itemPedido.dart';
import 'package:wapper/app/data/model/pedidoModel.dart';
import 'package:wapper/app/ui/utils/mask_formatter.dart';

class CartController extends GetxController {
  Rxn<PaymentForm> selectedPaymentForm = Rxn<PaymentForm>();
  Rxn<ClienteModel> clienteLogado = Rxn<ClienteModel>();
  final MaskFormatter formatter = MaskFormatter();
  Rxn<PedidoModel> pedido = Rxn<PedidoModel>();

  double subtotal() {
    double valor = 0;
    for (final ItemPedidoModel item in pedido.value?.itemsPedido ?? []) {
      valor += item.valorItem;
    }
    return valor;
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
