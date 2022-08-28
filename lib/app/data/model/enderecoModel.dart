import 'package:wapper/app/data/model/clienteModel.dart';

class EnderecoModel {
  int? idEndereco;
  String? logradouro;
  String? complemento;
  String? numero;
  int? cep;
  int? statusEndereco;

  EnderecoModel({
    this.idEndereco,
    this.logradouro,
    this.complemento,
    this.numero,
    this.cep,
    this.statusEndereco = Status.ATIVO,
  });

  EnderecoModel.fromJson(Map<String, dynamic> json) {
    this.idEndereco = json['id'];
    this.logradouro = json['logradouro'];
    this.complemento = json['complemento'];
    this.numero = json['numero'];
    this.cep = json['cep'];
    this.statusEndereco = json['statusEndereco'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.idEndereco;
    data['logradouro'] = this.logradouro;
    data['complemento'] = this.complemento;
    data['numero'] = this.numero;
    data['cep'] = this.cep;
    data['statusEndereco'] = this.statusEndereco;

    return data;
  }
}
