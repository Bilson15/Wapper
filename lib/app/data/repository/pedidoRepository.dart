import 'dart:convert';

import 'package:wapper/app/data/model/pedidoModel.dart';
import 'package:wapper/app/ui/shared/ApiService.dart';

class PedidoRepository {
  late ApiService api;

  PedidoRepository() {
    api = ApiService();
  }

  Future<PedidoModel> criarPedido(PedidoModel pedido) async {
    var response = await api.post('/pedido', pedido.toJson());

    var data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      PedidoModel pedido = PedidoModel.fromJson(data);

      return pedido;
    } else {
      var error = json.decode(response.body)['message'];
      print(error);

      throw error;
    }
  }
}
