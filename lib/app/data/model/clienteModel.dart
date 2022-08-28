import 'package:wapper/app/data/model/enderecoModel.dart';
import 'package:wapper/app/data/model/telefoneClienteModel.dart';

class ClienteModel {
  int? idCliente;
  String? nome;
  String? email;
  String? senha;
  String? cpf;
  String? sexo;
  String? dataNascimento;
  int? statusCliente;
  List<TelefoneClienteModel>? telefoneCliente;
  List<EnderecoModel>? endereco;

  ClienteModel({
    this.idCliente,
    this.nome,
    this.email,
    this.senha,
    this.cpf,
    this.sexo,
    this.statusCliente = Status.ATIVO,
    this.dataNascimento,
    this.telefoneCliente,
    this.endereco,
  });

  ClienteModel.fromJson(Map<String, dynamic> json) {
    this.idCliente = json['id'];
    this.nome = json['nome'];
    this.email = json['email'];
    this.senha = json['senha'];
    this.cpf = json['cpf'];
    this.sexo = json['sexo'];
    this.statusCliente = json['status_cliente'];
    this.dataNascimento = json['data_nascimento'];
    this.telefoneCliente = json['telefone_cliente'] != null
        ? json['telefoneCliente'].map<TelefoneClienteModel>((data) {
            return TelefoneClienteModel.fromJson(data);
          }).toList()
        : null;
    this.endereco = json['endereco'] != null
        ? json['endereco'].map<EnderecoModel>((data) {
            return EnderecoModel.fromJson(data);
          }).toList()
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.idCliente;
    data['nome'] = this.nome;
    data['email'] = this.email;
    data['senha'] = this.senha;
    data['cpf'] = this.cpf;
    data['sexo'] = this.sexo;
    data['data_nascimento'] = this.dataNascimento.toString();
    data['status_cliente'] = this.statusCliente;
    data['telefoneCliente'] = this.endereco != null ? this.telefoneCliente!.map((e) => e.toJson()).toList() : null;
    data['endereco'] = this.endereco != null ? this.endereco!.map((e) => e.toJson()).toList() : null;

    return data;
  }
}

class Status {
  static const int ATIVO = 1;
  static const int INATIVO = 0;
}
