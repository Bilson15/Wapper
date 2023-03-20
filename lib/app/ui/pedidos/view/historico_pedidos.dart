import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:wapper/app/ui/components/button_component.dart';
import 'package:wapper/app/ui/components/text_component.dart';
import 'package:wapper/app/ui/info_pedido/view/info_pedido.dart';
import 'package:wapper/app/ui/pedidos/controller/historico_pedidos_controller.dart';
import 'package:wapper/app/ui/theme/styles.dart';
import 'package:wapper/app/ui/utils/utils.dart';

class HistoricoPedidos extends StatelessWidget {
  const HistoricoPedidos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HistoricoPedidoController>(tag: 'historico_controller');
    return Obx(
      () => Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: Utils.paddingSafeAreaTop(context),
              ),
              const SizedBox(
                height: 16,
              ),
              Center(
                child: TextComponent(
                  'MINHA AGENDA',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: cinzaPadrao,
                ),
              ),
              const SizedBox(
                height: 29,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextComponent(
                      'Histórico',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: black,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ListView(
                  controller: ScrollController(initialScrollOffset: 0),
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  children: controller.listPedido.map((pedido) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 32),
                      child: GestureDetector(
                        onTap: () {
                          Get.to(InfoPedido(pedido: pedido));
                        },
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 3),
                                  child: TextComponent(
                                    '${DateFormat('dd/MM/yyyy').format(pedido.diaMarcado)}',
                                    color: cinzaPadrao,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              height: 180,
                              decoration: BoxDecoration(
                                color: backgroundFieldColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.symmetric(vertical: 8),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(50),
                                                child: Container(
                                                  height: 40,
                                                  width: 40,
                                                  color: azulPadrao,
                                                  child: Center(
                                                    child: Row(
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        TextComponent(
                                                          '${pedido.empresa.razaoSocial?.split(' ').first[0].toUpperCase()}',
                                                          fontWeight: FontWeight.bold,
                                                          color: Colors.white,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 16),
                                              child: TextComponent(
                                                '${pedido.empresa.razaoSocial}',
                                                color: black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Divider(
                                          thickness: 1,
                                          color: lineColor,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            TextComponent(
                                              'Pedido ${Utils.getStatusPedido(pedido)} • Nº ${pedido.idPedido}',
                                              color: cinzaPadrao,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            TextComponent(
                                              '${pedido.itemsPedido.first.servicoModel.resumo}',
                                              color: cinzaPadrao,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: azulPadrao,
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                                        ),
                                        child: Center(
                                          child: TextComponent(
                                            'Detalhes',
                                            color: backgroundFieldColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              !controller.loading.value
                  ? Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: SizedBox(
                        width: Get.width * 0.80,
                        child: ButtonComponent(
                          titulo: 'Carregar mais pedidos',
                          onPressed: () async {
                            await controller.loadMore();
                          },
                          backgroundColor: azulPadrao,
                        ),
                      ),
                    )
                  : const SizedBox.shrink()
            ],
          ),
        ),
      ),
    );
  }
}
