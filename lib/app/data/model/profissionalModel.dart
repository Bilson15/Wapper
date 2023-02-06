class ProfissionalModel {
  int? id;
  String? resumo;
  String? nome;
  int? status;

  ProfissionalModel({
    this.id,
    this.resumo,
    this.nome,
    this.status,
  });

  ProfissionalModel.fromJson(Map<String, dynamic> json) {
    this.id = json['id_profissional'];
    this.resumo = json['resumo'];
    this.nome = json['nome'];
    this.status = json['status_profissional'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_profissional'] = this.id;
    data['resumo'] = this.resumo;
    data['nome'] = this.nome;
    data['status_profissional'] = this.status;

    return data;
  }
}
