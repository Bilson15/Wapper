import 'package:flutter/material.dart';
import 'package:wapper/app/data/model/clienteModel.dart';
import 'package:wapper/app/data/model/itemPedido.dart';

class PedidoModel {
  int? idPedido;
  double? valorPedido;
  late TimeOfDay horarioMarcado;
  String? observacao;
  late ClienteModel cliente;
  late List<ItemPedidoModel> itemsPedido;

  PedidoModel({
    this.idPedido,
    this.valorPedido,
    required this.horarioMarcado,
    this.observacao,
    required this.cliente,
    this.itemsPedido = const [],
  });

  PedidoModel.fromJson(Map<String, dynamic> json) {
    this.idPedido = json['id_pedido'];
    this.valorPedido = json['valor_pedido'];
    this.horarioMarcado = json['horario_marcado'];
    this.observacao = json['observacao'];
    this.cliente = ClienteModel.fromJson(json['cliente']);
    this.itemsPedido = json['items_pedido'] != null
        ? json['items_pedido'].map<ItemPedidoModel>((data) {
            return ItemPedidoModel.fromJson(data);
          }).toList()
        : null;
    ;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_pedido'] = this.idPedido;
    data['valor_pedido'] = this.valorPedido;
    data['horario_marcado'] = '${this.horarioMarcado.hour}:${this.horarioMarcado.minute}:00';
    data['observacao'] = this.observacao;
    data['cliente'] = this.cliente.toJson();
    data['items_pedido'] = this.itemsPedido.map((e) => e.toJson()).toList();
    return data;
  }
}
