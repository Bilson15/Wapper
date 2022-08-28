import 'package:wapper/app/data/model/clienteModel.dart';

class TelefoneClienteModel {
  int? idTelefoneCliente;
  int? ddd;
  int? telefone;
  int? statusTelefone;

  TelefoneClienteModel({
    this.idTelefoneCliente,
    this.ddd,
    this.telefone,
    this.statusTelefone,
  });

  TelefoneClienteModel.fromJson(Map<String, dynamic> json) {
    this.idTelefoneCliente = json['id'];
    this.ddd = json['ddd'];
    this.telefone = json['telefone'];
    this.statusTelefone = json['statusTelefone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.idTelefoneCliente;
    data['ddd'] = this.ddd;
    data['telefone'] = this.telefone;
    data['statusTelefone'] = this.statusTelefone;

    return data;
  }
}
