import 'package:wapper/app/data/model/enderecoModel.dart';
import 'package:wapper/app/data/model/telefoneClienteModel.dart';

class EmpresaModel {
  int? idEmpresa;
  String? razaoSocial;
  String? email;
  String? senha;
  String? cnpj;
  String? nomeFantasia;
  DateTime? dataFundacao;
  String? ramoAtividade;
  int? status;
  List<TelefoneClienteModel>? telefoneCliente;
  List<EnderecoModel>? endereco;
}
