import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:wapper/app/ui/components/app_bar_component.dart';
import 'package:wapper/app/ui/components/button_component.dart';
import 'package:wapper/app/ui/components/form_field_component.dart';
import 'package:wapper/app/ui/components/text_component.dart';
import 'package:wapper/app/ui/feedback_service/controller/feedback_controller.dart';
import 'package:wapper/app/ui/theme/styles.dart';

class FeedBackPage extends StatelessWidget {
  FeedBackPage({Key? key}) : super(key: key);
  final controller = Get.put(FeedBackController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent(
        textComponent: const TextComponent(
          'Avaliação',
          fontWeight: FontWeight.w600,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15)), color: backgroundFieldColor),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
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
                                "https://img.freepik.com/vetores-gratis/logotipo-do-polo-de-barbeiro_1415-673.jpg?w=2000"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          children: [
                            TextComponent(
                              'O que você achou do parceiro ?',
                              color: fontColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            TextComponent(
                              'Escolha de 1 a 5 entrelas para classificar',
                              color: cinzaPadrao,
                              fontSize: 12,
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Obx(
                      () => RatingBar.builder(
                        initialRating: controller.starsParceiro.value,
                        itemCount: 5,
                        minRating: 1,
                        itemBuilder: (context, _) {
                          return Icon(
                            Icons.star,
                            color: amareloPadrao,
                          );
                        },
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextComponent(
                          'Deixe um comentário',
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
                      hintText: 'Ex: Ótimo serviços e atendimento!',
                      counterText: true,
                      maxLines: 3,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Divider(
                  thickness: 1,
                  color: lineColor,
                ),
              ),
              Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15)), color: backgroundFieldColor),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextComponent(
                            'Alexandre',
                            color: fontColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            textAlign: TextAlign.center,
                          ),
                          Row(
                            children: [
                              Container(
                                child: TextComponent(
                                  'Barbeiro • Mascúlino',
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
                            image: NetworkImage("https://media.linklist.bio/avatars/a49a1be9230757c50ded7381c87c664d.png"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          children: [
                            TextComponent(
                              'O que você achou do Profissional ?',
                              color: fontColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            TextComponent(
                              'Escolha de 1 a 5 entrelas para classificar',
                              color: cinzaPadrao,
                              fontSize: 12,
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Obx(
                      () => RatingBar.builder(
                        initialRating: controller.starsProfissional.value,
                        itemCount: 5,
                        minRating: 1,
                        itemBuilder: (context, _) {
                          return Icon(
                            Icons.star,
                            color: amareloPadrao,
                          );
                        },
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextComponent(
                          'Deixe um comentário',
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
                      hintText: 'Ex: Excelente profissional',
                      counterText: true,
                      maxLines: 3,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: SizedBox(
                  width: Get.width * 0.60,
                  child: ButtonComponent(
                    titulo: 'Avaliar',
                    backgroundColor: azulPadrao,
                    fontColor: backgroundFieldColor,
                    onPressed: () {
                      Get.toNamed('/root/2');
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
