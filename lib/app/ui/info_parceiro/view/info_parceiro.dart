import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wapper/app/ui/components/app_bar_component.dart';
import 'package:wapper/app/ui/components/card_service_seller.dart';
import 'package:wapper/app/ui/components/loading_component.dart';
import 'package:wapper/app/ui/components/text_component.dart';
import 'package:wapper/app/ui/info_parceiro/controller/info_parceiro_controller.dart';
import 'package:wapper/app/ui/service_parceiro/view/service_parceiro.dart';
import 'package:wapper/app/ui/theme/styles.dart';

class InfoParceiro extends StatelessWidget {
  final int idEmpresa;
  InfoParceiro({Key? key, required this.idEmpresa}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(InfoParceiroController(idEmpresa: idEmpresa));

    return Obx(() => controller.empresa.value == null
        ? Center(child: LoadingComponent())
        : Scaffold(
            appBar: AppBarComponent(
              textComponent: TextComponent(
                '${controller.empresa.value?.razaoSocial ?? ''}',
                fontWeight: FontWeight.w600,
              ),
            ),
            body: SingleChildScrollView(
              physics: ScrollPhysics(),
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
                              '${controller.empresa.value?.razaoSocial ?? ''}',
                              color: fontColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              textAlign: TextAlign.center,
                            ),
                            Row(
                              children: [
                                Container(
                                  child: TextComponent(
                                    '${controller.empresa.value?.ramoAtividade ?? ''}',
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
                                    '${controller.empresa.value?.razaoSocial?.split(' ').first[0].toUpperCase() ?? ''}',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            TextComponent(
                              'Serviços',
                              fontSize: 24,
                              color: fontColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                        Divider(
                          thickness: 1,
                          color: lineColor,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controller.empresa.value?.servicos?.length ?? 0,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  if (controller.empresa.value != null && controller.empresa.value!.servicos?[index] != null) {
                                    Get.to(ServicoParceiro(
                                      servico: controller.empresa.value!.servicos![index],
                                      empresa: controller.empresa.value!,
                                    ));
                                  }
                                },
                                child: CardServiceSeller(
                                  title: controller.empresa.value?.servicos?[index].titulo,
                                  description: controller.empresa.value?.servicos?[index].resumo,
                                  value: 'R\$ ${controller.empresa.value?.servicos?[index].valor.toStringAsFixed(2)}',
                                  icon: true,
                                ),
                              );
                            })
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ));
  }
}
