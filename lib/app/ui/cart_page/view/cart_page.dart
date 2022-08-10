import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:wapper/app/ui/cart_page/controller/cart_controller.dart';
import 'package:wapper/app/ui/components/app_bar_component.dart';
import 'package:wapper/app/ui/components/button_component.dart';
import 'package:wapper/app/ui/components/card_service_seller.dart';
import 'package:wapper/app/ui/components/item_pedido_component.dart';
import 'package:wapper/app/ui/components/text_component.dart';
import 'package:wapper/app/ui/theme/styles.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CartController());
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
          onPressed: () {
            // handle the press
          },
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
                        'Barbearia do Zé',
                        color: fontColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.center,
                      ),
                      Row(
                        children: [
                          Container(
                            child: TextComponent(
                              'Barbearia mascúlino • 2,9 km',
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
                  Container(
                    width: 55,
                    height: 55,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                            "https://img.elo7.com.br/product/zoom/2E9706C/logotipo-personalizada-barbearia-arte-digital-tesoura.jpg"),
                      ),
                    ),
                  ),
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
                descricao: 'Corte cabelo + barba',
                valor: 25.50,
                date: '12:00 - 13:00',
                profissional: 'Alexandre',
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
                ],
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
                          'Forma de Pagamento',
                          color: fontColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ),
                  Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: Get.width / 2,
                          child: GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(18), topRight: Radius.circular(18)),
                                  ),
                                  elevation: 0,
                                  builder: (BuildContext context) {
                                    return Stack(
                                      children: [
                                        Container(
                                          height: Get.height / 2,
                                          child: ListView.builder(
                                            itemCount: 1,
                                            itemBuilder: ((context, index) {
                                              return ListTile(
                                                leading: Icon(
                                                  Icons.payments_outlined,
                                                  color: greenMoney,
                                                ),
                                                title: new Text('Pagamento em dinheiro'),
                                                onTap: () {
                                                  controller.selectedPaymentForm.value = PaymentForm(id: 1, title: 'Dinheiro');
                                                  Get.back();
                                                },
                                              );
                                            }),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(top: 10),
                                              height: 4,
                                              width: 70,
                                              decoration: BoxDecoration(
                                                color: cinzaPadrao,
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(20),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    );
                                  });
                            },
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration:
                                        BoxDecoration(borderRadius: BorderRadius.circular(80), color: backgroundFieldColor),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                              padding: EdgeInsets.symmetric(horizontal: 8),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Row(
                                                    children: [
                                                      TextComponent(
                                                        controller.selectedPaymentForm.value == null
                                                            ? 'Selecione'
                                                            : '${controller.selectedPaymentForm.value?.title ?? ''}',
                                                        color: fontColor,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 12,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              )),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 8),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                size: 25,
                                                Icons.keyboard_arrow_down,
                                                color: fontColor,
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
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
                  onPressed: () {
                    Get.toNamed('/info-pedido');
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
