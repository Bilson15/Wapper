import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wapper/app/ui/components/text_component.dart';
import 'package:wapper/app/ui/home_page/controller/home_controller.dart';
import 'package:wapper/app/ui/theme/styles.dart';

import '../../components/appbar/app_bar_component.dart';
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextComponent(
                  'R. 19-D, 839',
                  color: cinzaPadrao,
                  fontWeight: FontWeight.bold,
                ),
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
                      print(index);
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
                                          "https://img.freepik.com/vetores-gratis/logotipo-do-polo-de-barbeiro_1415-673.jpg?w=2000"))),
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
                  return GestureDetector(
                    onTap: () {
                      print('object - ${index}');
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
                                        image: NetworkImage(
                                            "https://img.freepik.com/vetores-gratis/logotipo-do-polo-de-barbeiro_1415-673.jpg?w=2000"))),
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
                                      'Barbearia do Zé ${index}',
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
                                            '• Barbearia mascúlino • 2,9 km • Barbearia mascúlino • 2,9 km',
                                            color: cinzaPadrao,
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
                            child: Obx(
                              () => GestureDetector(
                                onTap: () {
                                  controller.favorite(!controller.favorite.value);
                                },
                                child: !controller.favorite.value
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
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: AppBarComponent(0),
    );
  }
}
