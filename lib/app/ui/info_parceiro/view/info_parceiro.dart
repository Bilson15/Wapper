import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:wapper/app/ui/components/app_bar_component.dart';
import 'package:wapper/app/ui/components/card_service_seller.dart';
import 'package:wapper/app/ui/components/text_component.dart';
import 'package:wapper/app/ui/theme/styles.dart';

class InfoParceiro extends StatelessWidget {
  const InfoParceiro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent(
        textComponent: const TextComponent(
          'Barbearia do Zé',
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
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Get.toNamed('/servico-parceiro');
                          },
                          child: CardServiceSeller(
                            title: 'Corte de cabelo + Barba',
                            description: 'Corte mascúlino, degradê, social ou á sua escolha',
                            value: 'R\$ 25,00',
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
    );
  }
}
