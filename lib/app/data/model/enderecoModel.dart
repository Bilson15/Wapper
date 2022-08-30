import 'package:wapper/app/data/model/clienteModel.dart';

class EnderecoModel {
  int? idEndereco;
  String? logradouro;
  String? complemento;
  String? numero;
  int? cep;
  String? bairro;
  int? statusEndereco;

  EnderecoModel({
    this.idEndereco,
    this.logradouro,
    this.complemento,
    this.numero,
    this.cep,
    this.bairro,
    this.statusEndereco = Status.ATIVO,
  });

  EnderecoModel.fromJson(Map<String, dynamic> json) {
    this.idEndereco = json['idEndereco'];
    this.logradouro = json['logradouro'];
    this.complemento = json['complemento'];
    this.numero = json['numero'];
    this.cep = json['cep'];
    this.bairro = json['bairro'];
    this.statusEndereco = json['statusEndereco'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idEndereco'] = this.idEndereco;
    data['logradouro'] = this.logradouro;
    data['complemento'] = this.complemento;
    data['numero'] = this.numero;
    data['cep'] = this.cep;
    data['bairro'] = this.bairro;
    data['statusEndereco'] = this.statusEndereco;

    return data;
  }
}
