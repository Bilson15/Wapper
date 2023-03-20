import 'dart:convert';

import 'package:wapper/app/data/model/pageModel.dart';
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

  Future<List> buscarPedidosCliente(int pagina, int idCliente) async {
    Map<String, String> queryParameters = {
      'page': '$pagina',
    };

    var response = await api.get('/pedido/cliente/$idCliente', queryParameters: queryParameters);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      List<PedidoModel> empresas = data['content'].map<PedidoModel>((data) => PedidoModel.fromJson(data)).toList();

      PageModel pagina = PageModel.fromJson(data);
      return [empresas, pagina];
    } else {
      var error = json.decode(response.body)['error'];
      throw error;
    }
  }
}
