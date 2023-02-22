import 'package:flutter/material.dart';

class ProfissionalModel {
  int? id;
  String? resumo;
  String? nome;
  int? status;
  late TimeOfDay inicioAtendimento;
  late TimeOfDay fimAtendimento;

  ProfissionalModel({
    this.id,
    this.resumo,
    this.nome,
    this.status,
    required this.inicioAtendimento,
    required this.fimAtendimento,
  });

  ProfissionalModel.fromJson(Map<String, dynamic> json) {
    this.id = json['id_profissional'];
    this.resumo = json['resumo'];
    this.nome = json['nome'];
    this.status = json['status_profissional'];
    this.inicioAtendimento = _tratarHorario(json['inicio_atendimento']);
    this.fimAtendimento = _tratarHorario(json['fim_atendimento']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_profissional'] = this.id;
    data['resumo'] = this.resumo;
    data['nome'] = this.nome;
    data['status_profissional'] = this.status;
    data['inicio_atendimento'] = '${this.inicioAtendimento.hour}:${this.inicioAtendimento.minute}:00';
    data['fim_atendimento'] = '${this.fimAtendimento.hour}:${this.fimAtendimento.minute}:00';
    return data;
  }

  TimeOfDay _tratarHorario(String json) {
    int hour = int.parse(json.split(':')[0]);
    int minute = int.parse(json.split(':')[1]);

    return TimeOfDay(hour: hour, minute: minute);
  }
}
