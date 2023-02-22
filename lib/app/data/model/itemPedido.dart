import 'package:wapper/app/data/model/profissionalModel.dart';
import 'package:wapper/app/data/model/servicoModel.dart';

class ItemPedidoModel {
  int? idItemPedido;
  late double valorItem;
  late ServicoModel servicoModel;
  late ProfissionalModel profissionalModel;

  ItemPedidoModel({
    this.idItemPedido,
    this.valorItem = 0,
    required this.servicoModel,
    required this.profissionalModel,
  });

  ItemPedidoModel.fromJson(Map<String, dynamic> json) {
    this.idItemPedido = json['id_item_pedido'];
    this.valorItem = json['valor_item'];
    this.servicoModel = ServicoModel.fromJson(json['servico']);
    this.profissionalModel = ProfissionalModel.fromJson(json['profissional']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_item_pedido'] = this.idItemPedido;
    data['valor_item'] = this.valorItem;
    data['servico'] = this.servicoModel.toJson();
    data['profissional'] = this.profissionalModel.toJson();
    return data;
  }
}
