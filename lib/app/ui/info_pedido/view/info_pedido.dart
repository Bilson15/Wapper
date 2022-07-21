import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wapper/app/ui/components/app_bar_component.dart';
import 'package:wapper/app/ui/components/button_component.dart';
import 'package:wapper/app/ui/components/item_pedido_component.dart';
import 'package:wapper/app/ui/components/text_component.dart';
import 'package:wapper/app/ui/theme/styles.dart';

class InfoPedido extends StatelessWidget {
  const InfoPedido({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  Container(
                    width: 55,
                    height: 55,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                            "https://img.freepik.com/vetores-gratis/logotipo-do-polo-de-barbeiro_1415-673.jpg?w=2000"),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextComponent(
                      'Barbearia do zé',
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
                  'Pedido concluído em 26 Janeiro 2022 - 16:43',
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
                    'Pedido nº 6545',
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
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ItemPedidoComponent(
                        quantidade: 1,
                        descricao: 'Corte cabelo + barba',
                        valor: 25.50,
                        date: '12:00 - 13:00',
                        profissional: 'Alexandre',
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
                          'R\$ 51.00',
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
                          'R\$ 51.00',
                          color: fontColor,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Divider(
                    thickness: 1,
                    color: lineColor,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextComponent(
                          'Pagamento',
                          color: cinzaPadrao,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.payments_outlined,
                              color: greenMoney,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            TextComponent(
                              'Dinheiro',
                              fontWeight: FontWeight.bold,
                              color: fontColor,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 1,
                    color: lineColor,
                  ),
                ],
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
                          'R. 25 D, 845 - Qd 168 Lt 61',
                          color: cinzaPadrao,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        TextComponent(
                          'St. Garavelo - Aparecida de goiânia',
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
