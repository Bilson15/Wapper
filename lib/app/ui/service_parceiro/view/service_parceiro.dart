import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wapper/app/ui/components/app_bar_component.dart';
import 'package:wapper/app/ui/components/button_component.dart';
import 'package:wapper/app/ui/components/card_service_seller.dart';
import 'package:wapper/app/ui/components/form_field_component.dart';
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
                    padding: EdgeInsets.only(top: 4, bottom: 16),
                    child: TextComponent(
                      'Selecione o Profissional',
                      fontWeight: FontWeight.w600,
                      color: fontColor,
                    ),
                  ),
                ],
              ),
              GestureDetector(
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
                                itemCount: 10,
                                itemBuilder: ((context, index) {
                                  return ListTile(
                                      leading: Container(
                                        width: 50,
                                        height: 50,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: NetworkImage(
                                                "https://media.istockphoto.com/illustrations/illustration-of-a-stylish-young-man-avatar-of-a-man-for-profile-for-illustration-id1256010006"),
                                          ),
                                        ),
                                      ),
                                      title: new Text('Alexandre ${index}'),
                                      subtitle: Row(
                                        children: [
                                          Row(
                                            children: [
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
                                              const SizedBox(
                                                width: 4,
                                              ),
                                              Container(
                                                child: TextComponent(
                                                  '• Barbeiro • Mascúlino',
                                                  color: cinzaPadrao,
                                                  textOverflow: TextOverflow.ellipsis,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      onTap: () {
                                        Get.back();
                                      });
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
                        height: 60,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(80), color: backgroundFieldColor),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(
                                        "https://media.istockphoto.com/illustrations/illustration-of-a-stylish-young-man-avatar-of-a-man-for-profile-for-illustration-id1256010006"),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          TextComponent(
                                            'Alexandre',
                                            color: fontColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
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
                                          const SizedBox(
                                            width: 4,
                                          ),
                                          Container(
                                            child: TextComponent(
                                              '• Barbeiro • Mascúlino',
                                              color: cinzaPadrao,
                                              textOverflow: TextOverflow.ellipsis,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      )
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
                                    size: 40,
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
              const SizedBox(
                height: 16,
              ),
              Column(
                children: [
                  Divider(
                    thickness: 1,
                    color: lineColor,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 4, bottom: 16),
                        child: TextComponent(
                          'Selecione o Horário',
                          fontWeight: FontWeight.w600,
                          color: fontColor,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
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
                                    itemCount: 10,
                                    itemBuilder: ((context, index) {
                                      return ListTile(
                                          title: Row(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.symmetric(horizontal: 4),
                                                child: TextComponent(
                                                  '12:00',
                                                  color: cinzaPadrao,
                                                  textOverflow: TextOverflow.ellipsis,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.symmetric(horizontal: 4),
                                                child: TextComponent(
                                                  '•',
                                                  color: cinzaPadrao,
                                                  textOverflow: TextOverflow.ellipsis,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.symmetric(horizontal: 4),
                                                child: TextComponent(
                                                  '13:00',
                                                  color: cinzaPadrao,
                                                  textOverflow: TextOverflow.ellipsis,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.symmetric(horizontal: 4),
                                                child: TextComponent(
                                                  '-',
                                                  color: cinzaPadrao,
                                                  textOverflow: TextOverflow.ellipsis,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.symmetric(horizontal: 4),
                                                child: TextComponent(
                                                  (index % 2 == 0 ? 'Disponível' : 'Reservado'),
                                                  color: cinzaPadrao,
                                                  textOverflow: TextOverflow.ellipsis,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ],
                                          ),
                                          onTap: () {
                                            Get.back();
                                          });
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
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(80), color: backgroundFieldColor),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 8),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 4),
                                            child: TextComponent(
                                              '12:00',
                                              color: cinzaPadrao,
                                              textOverflow: TextOverflow.ellipsis,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 4),
                                            child: TextComponent(
                                              '•',
                                              color: cinzaPadrao,
                                              textOverflow: TextOverflow.ellipsis,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 4),
                                            child: TextComponent(
                                              '13:00',
                                              color: cinzaPadrao,
                                              textOverflow: TextOverflow.ellipsis,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 4),
                                            child: TextComponent(
                                              '-',
                                              color: cinzaPadrao,
                                              textOverflow: TextOverflow.ellipsis,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 4),
                                            child: TextComponent(
                                              'Disponível',
                                              color: cinzaPadrao,
                                              textOverflow: TextOverflow.ellipsis,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                            ),
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
                                        size: 40,
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
                  const SizedBox(
                    height: 16,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextComponent(
                        'Alguma observação ?',
                        color: fontColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  InputFormFieldComponent(
                    maxLength: 140,
                    hintText: 'Ex: Chegarei 5 minutos adiantado do horário marcado...',
                    counterText: true,
                    maxLines: 3,
                    textInputAction: TextInputAction.done,
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Container(
                width: Get.width * 0.70,
                child: ButtonComponent(
                  backgroundColor: azulPadrao,
                  titulo: 'Confirmar',
                  onPressed: () {
                    Get.toNamed('/cart-page');
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
