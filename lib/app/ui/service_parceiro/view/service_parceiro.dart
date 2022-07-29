import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wapper/app/ui/components/app_bar_component.dart';
import 'package:wapper/app/ui/components/card_service_seller.dart';
import 'package:wapper/app/ui/components/text_component.dart';
import 'package:wapper/app/ui/theme/styles.dart';

class ServicoParceiro extends StatelessWidget {
  const ServicoParceiro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent(
        textComponent: const TextComponent(
          'Serviço',
          fontWeight: FontWeight.w600,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: TextComponent(
                      'Corte de cabelo + Barba',
                      color: fontColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    width: Get.width,
                    child: Row(
                      children: [
                        Flexible(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 4),
                            child: TextComponent(
                              'Corte mascúlino, degradê, social ou á sua escolha',
                              color: cinzaPadrao,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
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
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: TextComponent(
                      'Selecione o Profissional',
                      fontWeight: FontWeight.w600,
                      color: fontColor,
                    ),
                  ),
                ],
              ),

              // CardServiceSeller(
              //   title: 'Corte de cabelo + Barba',
              //   description: 'Corte mascúlino, degradê, social ou á sua escolha',
              //   value: 'R\$ 25,00',
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
