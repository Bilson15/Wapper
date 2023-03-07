import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:wapper/app/data/model/pedidoModel.dart';
import 'package:wapper/app/ui/cart_page/controller/cart_controller.dart';
import 'package:wapper/app/ui/components/app_bar_component.dart';
import 'package:wapper/app/ui/components/button_component.dart';
import 'package:wapper/app/ui/components/item_pedido_component.dart';
import 'package:wapper/app/ui/components/text_component.dart';
import 'package:wapper/app/ui/theme/styles.dart';

class CartPage extends StatelessWidget {
  final PedidoModel pedido;

  CartPage({Key? key, required this.pedido}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CartController>(tag: 'cart_controller');
    controller.pedido.value = this.pedido;
    return Scaffold(
      appBar: AppBarComponent(
        textComponent: const TextComponent(
          'Meu Carrinho',
          fontWeight: FontWeight.w600,
        ),
        action: IconButton(
          icon: Icon(
            Icons.remove_shopping_cart_outlined,
            color: backgroundFieldColor,
          ),
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          tooltip: 'Cancelar carrinho',
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextComponent(
                        '${controller.pedido.value?.empresa.razaoSocial}',
                        color: fontColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.center,
                      ),
                      Row(
                        children: [
                          Container(
                            child: TextComponent(
                              '${controller.pedido.value?.empresa.ramoAtividade}',
                              color: cinzaPadrao,
                              textOverflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Icon(
                            size: 15,
                            Icons.star,
                            color: amareloPadrao,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          TextComponent(
                            '4,5',
                            color: amareloPadrao,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      )
                    ],
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      height: 55,
                      width: 55,
                      color: azulPadrao,
                      child: Center(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextComponent(
                              '${controller.pedido.value!.empresa.razaoSocial!.split(' ').first[0].toUpperCase()}',
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Divider(
                thickness: 1,
                color: lineColor,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      TextComponent(
                        'Local do serviço',
                        fontWeight: FontWeight.bold,
                        color: fontColor,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      TextComponent(
                        'R. 02D, 854 - QD 168 lt 61',
                        color: cinzaPadrao,
                        fontSize: 12,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      TextComponent(
                        'St. Garavelo - Aparecida de Goiânia',
                        color: cinzaPadrao,
                        fontSize: 12,
                      ),
                    ],
                  ),
                ],
              ),
              Divider(
                thickness: 1,
                color: lineColor,
              ),
              ItemPedidoComponent(
                quantidade: 1,
                descricao: controller.pedido.value?.itemsPedido.first.servicoModel.resumo ?? '',
                valor: controller.pedido.value?.itemsPedido.first.servicoModel.valor,
                date:
                    '${controller.pedido.value?.horarioMarcado.hour}:${controller.pedido.value?.horarioMarcado.minute} - ${DateFormat('dd/MM/yyyy').format(controller.pedido.value!.diaMarcado)}',
                profissional: controller.pedido.value?.itemsPedido.first.profissionalModel.nome,
              ),
              Divider(
                thickness: 1,
                color: lineColor,
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Row(
                      children: [
                        TextComponent(
                          'Valores',
                          color: fontColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextComponent(
                            'Subotal',
                            color: cinzaPadrao,
                          ),
                          TextComponent(
                            'R\$ ${controller.subtotal().toStringAsFixed(2)}',
                            color: cinzaPadrao,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextComponent(
                            'Taxa',
                            color: cinzaPadrao,
                          ),
                          TextComponent(
                            'R\$ 00.00',
                            color: cinzaPadrao,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextComponent(
                            'Total',
                            color: fontColor,
                          ),
                          TextComponent(
                            'R\$ ${controller.pedido.value?.valorPedido?.toStringAsFixed(2)}',
                            color: fontColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        controller.selectedPaymentForm.value != null
                            ? Row(
                                children: [
                                  Icon(
                                    Icons.payments_outlined,
                                    color: greenMoney,
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                ],
                              )
                            : SizedBox.shrink(),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 34,
              ),
              Container(
                width: Get.width * 0.70,
                child: ButtonComponent(
                  backgroundColor: azulPadrao,
                  titulo: 'Finalizar',
                  onPressed: () async {
                    await controller.criarPedido();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
