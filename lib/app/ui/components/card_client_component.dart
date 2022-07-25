import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wapper/app/ui/components/text_component.dart';
import 'package:wapper/app/ui/theme/styles.dart';

class CardClientComponent extends StatelessWidget {
  const CardClientComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed('/info-parceiro');
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        child: Row(
          children: [
            Expanded(
              flex: 0,
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Container(
                  width: 66,
                  height: 66,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image:
                          NetworkImage("https://img.freepik.com/vetores-gratis/logotipo-do-polo-de-barbeiro_1415-673.jpg?w=2000"),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextComponent(
                        'Barbearia do Zé',
                        color: fontColor,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 6,
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
                            width: Get.width * 0.45,
                            child: TextComponent(
                              '• Barbearia mascúlino • 2,9 km',
                              color: cinzaPadrao,
                              textOverflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 0,
              child: GestureDetector(
                onTap: () {},
                child: 1 == 1
                    ? Icon(
                        size: 25,
                        Icons.favorite_border,
                        color: cinzaPadrao,
                      )
                    : const Icon(
                        Icons.favorite,
                        color: Color.fromARGB(255, 255, 0, 0),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
