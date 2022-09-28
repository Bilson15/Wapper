import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wapper/app/data/model/empresaModel.dart';
import 'package:wapper/app/ui/components/text_component.dart';
import 'package:wapper/app/ui/home_page/controller/home_controller.dart';
import 'package:wapper/app/ui/theme/styles.dart';

// ignore: must_be_immutable
class CardClientComponent extends StatefulWidget {
  EmpresaModel empresa = EmpresaModel();
  CardClientComponent({Key? key, required this.empresa}) : super(key: key);

  @override
  State<CardClientComponent> createState() => _CardClientComponentState();
}

class _CardClientComponentState extends State<CardClientComponent> {
  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>(tag: 'home_controller');
    return GestureDetector(
      onTap: () {
        Get.toNamed('/info-parceiro/${widget.empresa.id}');
        homeController.clickSaveUltimoAcesso(widget.empresa.id.toString());
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        child: Row(
          children: [
            Expanded(
              flex: 0,
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: ClipRRect(
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
                            '${widget.empresa.razaoSocial?.split(' ').first[0].toUpperCase() ?? ''}',
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ],
                      ),
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
                        widget.empresa.razaoSocial ?? '',
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
                              '• ${widget.empresa.ramoAtividade ?? ''}',
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
                onTap: () {
                  setState(() {
                    widget.empresa.favorite = !widget.empresa.favorite;
                  });
                },
                child: !widget.empresa.favorite
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
