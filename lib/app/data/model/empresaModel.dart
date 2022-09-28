import 'package:get/get.dart';
import 'package:wapper/app/data/model/enderecoModel.dart';
import 'package:wapper/app/data/model/telefoneClienteModel.dart';

class EmpresaModel {
  EmpresaModel({
    this.id,
    this.razaoSocial,
    this.email,
    this.dataFundacao,
    this.cnpj,
    this.ramoAtividade,
    this.statusEmpresa,
    this.telefoneCliente,
    this.endereco,
  });
  int? id;
  String? razaoSocial;
  String? email;
  String? dataFundacao;
  String? cnpj;
  String? ramoAtividade;
  int? statusEmpresa;
  List<TelefoneClienteModel>? telefoneCliente;
  List<EnderecoModel>? endereco;
  bool favorite = false;

  EmpresaModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    razaoSocial = json['razaoSocial'];
    email = json['email'];
    dataFundacao = json['dataFundacao'];
    cnpj = json['cnpj'];
    ramoAtividade = json['ramoAtividade'];
    statusEmpresa = json['statusEmpresa'];
    telefoneCliente = json['telefone_cliente'] != null
        ? json['telefoneCliente'].map<TelefoneClienteModel>((data) {
            return TelefoneClienteModel.fromJson(data);
          }).toList()
        : null;
    endereco = json['endereco'] != null
        ? json['endereco'].map<EnderecoModel>((data) {
            return EnderecoModel.fromJson(data);
          }).toList()
        : null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['razaoSocial'] = razaoSocial;
    _data['email'] = email;
    _data['dataFundacao'] = dataFundacao;
    _data['cnpj'] = cnpj;
    _data['ramoAtividade'] = ramoAtividade;
    _data['statusEmpresa'] = statusEmpresa;
    _data['telefoneCliente'] = this.endereco != null ? this.telefoneCliente!.map((e) => e.toJson()).toList() : null;
    _data['endereco'] = this.endereco != null ? this.endereco!.map((e) => e.toJson()).toList() : null;
    return _data;
  }
}
