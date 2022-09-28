import 'dart:math';

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
    final controller = Get.find<HomeController>(tag: 'home_controller');
    controller.buscarEmpresasUltimosAcessos();
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
                  'Bem-vindo (a)',
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
          Obx(
            (() => controller.listUltimosAcessos.length > 0
                ? Row(
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
                  )
                : SizedBox.shrink()),
          ),
          Obx(
            () => controller.listUltimosAcessos.length > 0
                ? Container(
                    height: 80,
                    width: Get.width,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Obx(
                        () => ListView.builder(
                          controller: ScrollController(initialScrollOffset: 0),
                          itemCount: controller.listUltimosAcessos.length > 10 ? 10 : controller.listUltimosAcessos.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Get.toNamed('/info-parceiro/${controller.listUltimosAcessos[index].id}');
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 14),
                                child: SizedBox(
                                  width: 67,
                                  child: Column(
                                    children: [
                                      ClipRRect(
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
                                                  '${controller.listUltimosAcessos[index].razaoSocial?.split(' ').first[0].toUpperCase() ?? ''}',
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: TextComponent(
                                          controller.listUltimosAcessos[index].razaoSocial ?? '',
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
                  )
                : SizedBox.shrink(),
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
            height: 8,
          ),
          Obx(
            () => controller.listEmpresas.length > 0
                ? Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Stack(
                        children: [
                          ListView.builder(
                            controller: controller.scrollController,
                            itemCount: controller.listEmpresas.length,
                            itemBuilder: (context, index) {
                              return CardClientComponent(
                                empresa: controller.listEmpresas[index],
                              );
                            },
                          ),
                          controller.loading.value!
                              ? Stack(children: [
                                  Positioned(
                                    child: CircularProgressIndicator(
                                      strokeWidth: 5,
                                      color: azulPadrao,
                                    ),
                                    left: (Get.width / 2) - 20,
                                    bottom: 16,
                                  ),
                                ])
                              : SizedBox.shrink()
                        ],
                      ),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 32),
                    child: CircularProgressIndicator(
                      strokeWidth: 5,
                      color: azulPadrao,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
