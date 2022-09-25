import 'dart:convert';

import 'package:wapper/app/data/model/clienteModel.dart';
import 'package:wapper/app/data/model/loginModel.dart';
import 'package:wapper/app/ui/shared/ApiService.dart';

class ClienteRepository {
  late ApiService api;

  ClienteRepository() {
    api = ApiService();
  }

  Future<ClienteModel> login(LoginModel loginModel) async {
    var response = await api.post('/cliente/login', loginModel.toJson());

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
