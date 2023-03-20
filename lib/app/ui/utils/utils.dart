import 'package:flutter/material.dart';
import 'package:wapper/app/data/model/pedidoModel.dart';

class Utils {
  static paddingSafeAreaTop(context) {
    return EdgeInsets.only(top: MediaQuery.of(context).padding.top);
  }

  static String getStatusPedido(PedidoModel pedido) {
    switch (pedido.status) {
      case PedidoStatusEnum.criado:
        return 'agendado';
      case PedidoStatusEnum.finalizado:
        return 'concluído';
      case PedidoStatusEnum.cancelado:
        return 'cancelado';
      default:
        return 'agendado';
    }
  }
}
