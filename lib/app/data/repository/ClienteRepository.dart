import 'dart:convert';

import 'package:get/get.dart';
import 'package:wapper/app/data/model/clienteModel.dart';
import 'package:wapper/app/ui/shared/ApiService.dart';

class ClienteRepository {
  late ApiService api;

  ClienteRepository() {
    api = ApiService();
  }

  Future<ClienteModel> criarCliente(ClienteModel cliente) async {
    var response = await api.post('/cliente', cliente.toJson());

    var data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      ClienteModel cliente = ClienteModel.fromJson(data);

      return cliente;
    } else {
      var error = json.decode(response.body)['message'];
      print(error);

      throw error;
    }
  }
}
