import 'package:wapper/app/data/model/profissionalModel.dart';

class ServicoModel {
  int? id;
  String? titulo;
  String? resumo;
  double valor = 0;
  String? tempo_do_servico;
  int? status;
  List<ProfissionalModel>? profissionais;

  ServicoModel({
    this.id,
    this.titulo,
    this.resumo,
    this.valor = 0,
    this.tempo_do_servico,
    this.status,
    this.profissionais,
  });

  ServicoModel.fromJson(Map<String, dynamic> json) {
    this.id = json['id_servico'];
    this.titulo = json['titulo'];
    this.resumo = json['resumo'];
    this.valor = json['valor'] ?? 0;
    this.tempo_do_servico = json['tempo'];
    this.status = json['status'];
    this.profissionais = json['profissional'] != null
        ? json['profissional'].map<ProfissionalModel>((data) {
            return ProfissionalModel.fromJson(data);
          }).toList()
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_servico'] = this.id;
    data['titulo'] = this.titulo;
    data['resumo'] = this.resumo;
    data['valor'] = this.valor;
    data['tempo'] = this.tempo_do_servico;
    data['status'] = this.status;
    data['profissional'] = this.profissionais != null ? this.profissionais!.map((e) => e.toJson()).toList() : null;

    return data;
  }
}
