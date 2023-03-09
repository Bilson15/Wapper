import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wapper/app/data/model/pedidoModel.dart';
import 'package:wapper/app/ui/components/app_bar_component.dart';
import 'package:wapper/app/ui/components/button_component.dart';
import 'package:wapper/app/ui/components/item_pedido_component.dart';
import 'package:wapper/app/ui/components/text_component.dart';
import 'package:wapper/app/ui/info_pedido/controller/info_pedido_controller.dart';
import 'package:wapper/app/ui/theme/styles.dart';

class InfoPedido extends StatelessWidget {
  final PedidoModel pedido;
  const InfoPedido({
    Key? key,
    required this.pedido,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(InfoPedidoController(pedido: pedido));
    return Scaffold(
      appBar: AppBarComponent(
        textComponent: const TextComponent(
          'Detalhes do Pedido',
          fontWeight: FontWeight.w600,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
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
                              '${controller.pedido.empresa.razaoSocial?.split(' ').first[0].toUpperCase()}',
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextComponent(
                      controller.pedido.empresa.razaoSocial ?? '',
                      color: black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Chip(
                label: TextComponent(
                  'Seu pedido está ${controller.getStatusPedido()}',
                  color: cinzaPadrao,
                  fontSize: 14 * Get.textScaleFactor,
                ),
                backgroundColor: lineColor,
                avatar: Icon(
                  Icons.check_circle_outline_outlined,
                  color: green,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  TextComponent(
                    'Pedido nº ${controller.pedido.idPedido}',
                    fontWeight: FontWeight.w600,
                    color: fontColor,
                  )
                ],
              ),
              Divider(
                thickness: 1,
                color: lineColor,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.pedido.itemsPedido.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ItemPedidoComponent(
                        quantidade: 1,
                        descricao: controller.pedido.itemsPedido[index].servicoModel.resumo,
                        valor: controller.pedido.itemsPedido[index].servicoModel.valor,
                        date: controller.pedido.horarioMarcado.format(context),
                        profissional: controller.pedido.itemsPedido[index].profissionalModel.nome,
                      ),
                    ],
                  );
                },
              ),
              Divider(
                thickness: 1,
                color: lineColor,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextComponent(
                          'Subotal',
                          color: cinzaPadrao,
                        ),
                        TextComponent(
                          'R\$ ${(controller.pedido.valorPedido ?? 0).toStringAsFixed(2)}',
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
                          'R\$ ${(controller.pedido.valorPedido ?? 0).toStringAsFixed(2)}',
                          color: fontColor,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Column(
              //   children: [
              //     Divider(
              //       thickness: 1,
              //       color: lineColor,
              //     ),
              //     Padding(
              //       padding: const EdgeInsets.symmetric(vertical: 4),
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           TextComponent(
              //             'Pagamento',
              //             color: cinzaPadrao,
              //           ),
              //           Row(
              //             children: [
              //               Icon(
              //                 Icons.payments_outlined,
              //                 color: greenMoney,
              //               ),
              //               const SizedBox(
              //                 width: 4,
              //               ),
              //               TextComponent(
              //                 'Dinheiro',
              //                 fontWeight: FontWeight.bold,
              //                 color: fontColor,
              //               ),
              //             ],
              //           ),
              //         ],
              //       ),
              //     ),
              //     Divider(
              //       thickness: 1,
              //       color: lineColor,
              //     ),
              //   ],
              // ),
              Divider(
                thickness: 1,
                color: lineColor,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextComponent(
                          'Endereço do Parceiro',
                          color: fontColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        TextComponent(
                          '${controller.pedido.empresa.endereco?.first.logradouro ?? ''} - nº ${controller.pedido.empresa.endereco?.first.numero ?? ''}  \n${controller.pedido.empresa.endereco?.first.complemento ?? ''}',
                          color: cinzaPadrao,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        TextComponent(
                          '${controller.pedido.empresa.endereco?.first.bairro ?? ''}',
                          color: cinzaPadrao,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: SizedBox(
                  width: Get.width * 0.60,
                  child: ButtonComponent(
                    titulo: 'Avaliar Serviços',
                    backgroundColor: azulPadrao,
                    fontColor: backgroundFieldColor,
                    onPressed: () {
                      Get.toNamed('/feedback-page');
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
