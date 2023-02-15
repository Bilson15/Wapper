import 'package:flutter/material.dart';
import 'package:wapper/app/data/model/clienteModel.dart';

class PedidoModel {
  int? idPedido;
  double? valorPedido;
  TimeOfDay? horarioMarcado;
  String? observacao;
  ClienteModel? cliente;

  PedidoModel({
    this.idPedido,
    this.valorPedido,
    this.horarioMarcado,
    this.observacao,
    this.cliente,
  });
}
