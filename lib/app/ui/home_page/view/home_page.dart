import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wapper/app/ui/components/text_component.dart';
import 'package:wapper/app/ui/home_page/controller/home_controller.dart';
import 'package:wapper/app/ui/theme/styles.dart';
import '../../components/card_client_component.dart';
import '../../utils/utils.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: Utils.paddingSafeAreaTop(context),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextComponent(
                  'R. 19-D, 839',
                  color: cinzaPadrao,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                onPressed: () {
                  Get.toNamed('/cart-page');
                },
                icon: Icon(Icons.shopping_cart_outlined),
                tooltip: 'Ir para meu carrinho',
                color: azulPadrao,
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
                child: TextComponent(
                  'Últimos acessos',
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: fontColor,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 105,
            width: Get.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: ListView.builder(
                controller: ScrollController(initialScrollOffset: 0),
                itemCount: 15,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.toNamed('/info-parceiro');
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      child: SizedBox(
                        width: 67,
                        child: Column(
                          children: [
                            Container(
                              width: 66,
                              height: 66,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(
                                          "https://img.elo7.com.br/product/zoom/2E9706C/logotipo-personalizada-barbearia-arte-digital-tesoura.jpg"))),
                            ),
                            Flexible(
                              child: TextComponent(
                                'Barbearia do Zé',
                                color: cinzaPadrao,
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: TextComponent(
                  'Parceiros',
                  color: fontColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: ListView.builder(
                controller: ScrollController(initialScrollOffset: 0),
                itemCount: 15,
                itemBuilder: (context, index) {
                  return CardClientComponent();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
