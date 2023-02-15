import 'package:get/get.dart';
import 'package:wapper/app/data/model/clienteModel.dart';
import 'package:wapper/app/data/model/pedidoModel.dart';

class CartController extends GetxController {
  Rxn<PaymentForm> selectedPaymentForm = Rxn<PaymentForm>();
  Rxn<ClienteModel> clienteLogado = Rxn<ClienteModel>();

  Rxn<PedidoModel> pedido = Rxn<PedidoModel>();
}

class PaymentForm {
  int? id;
  String? title;
  PaymentForm({
    this.id,
    this.title = '',
  });
}
