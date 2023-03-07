import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wapper/app/data/model/clienteModel.dart';
import 'package:wapper/app/data/model/empresaModel.dart';
import 'package:wapper/app/data/model/itemPedido.dart';

enum PedidoStatusEnum {
  criado(0),
  finalizado(1);

  const PedidoStatusEnum(this.value);
  final int value;
}

class PedidoModel {
  int? idPedido;
  double? valorPedido;
  late DateTime diaMarcado;
  late TimeOfDay horarioMarcado;
  String? observacao;
  late PedidoStatusEnum status;
  late ClienteModel cliente;
  late EmpresaModel empresa;
  late List<ItemPedidoModel> itemsPedido;

  PedidoModel({
    this.idPedido,
    this.valorPedido,
    required this.diaMarcado,
    required this.horarioMarcado,
    this.observacao,
    required this.cliente,
    required this.empresa,
    required this.status,
    this.itemsPedido = const [],
  });

  PedidoModel.fromJson(Map<String, dynamic> json) {
    this.idPedido = json['id'];
    this.valorPedido = json['valor_pedido'];
    this.horarioMarcado = _fromTimeOfDay(json);
    this.diaMarcado = _fromDateTime(json);
    this.observacao = json['observacao'];
    this.status = statusHelper(json['status']);
    this.cliente = ClienteModel.fromJson(json['cliente']);
    this.itemsPedido = json['itemPedido'] != null
        ? json['itemPedido'].map<ItemPedidoModel>((data) {
            return ItemPedidoModel.fromJson(data);
          }).toList()
        : null;
    ;
  }

  DateTime _fromDateTime(Map<String, dynamic> json) {
    DateTime dateTime = DateTime(1);
    if (json['dia_marcado'] != null) {
      int year = int.parse(json['dia_marcado'].toString().split('-')[0]);
      int month = int.parse(json['dia_marcado'].toString().split('-')[1]);
      int day = int.parse(json['dia_marcado'].toString().split('-')[2]);
      dateTime = DateTime(year, month, day);
    }

    return dateTime;
  }

  TimeOfDay _fromTimeOfDay(Map<String, dynamic> json) {
    TimeOfDay timeOfDay = TimeOfDay(hour: 0, minute: 0);
    if (json['horario_marcado'] != null) {
      timeOfDay = new TimeOfDay(
          hour: int.parse(json['horario_marcado'].toString().split(':')[0]),
          minute: int.parse(json['horario_marcado'].toString().split(':')[1]));
    }
    return timeOfDay;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_pedido'] = this.idPedido;
    data['valor_pedido'] = this.valorPedido;
    data['horario_marcado'] = '${this.horarioMarcado.hour}:${this.horarioMarcado.minute}:00';
    data['dia_marcado'] = DateFormat('yyyy-MM-dd').format(this.diaMarcado);
    data['observacao'] = this.observacao;
    data['status'] = this.status.value;
    data['cliente'] = this.cliente.toJson();
    data['itemPedido'] = this.itemsPedido.map((e) => e.toJson()).toList();
    return data;
  }

  PedidoStatusEnum statusHelper(int status) {
    switch (status) {
      case 0:
        return PedidoStatusEnum.criado;
      case 1:
        return PedidoStatusEnum.finalizado;
      default:
        return PedidoStatusEnum.criado;
    }
  }
}
