import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:wapper/app/ui/components/text_component.dart';
import 'package:wapper/app/ui/theme/styles.dart';

class CardServiceSeller extends StatelessWidget {
  const CardServiceSeller({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 4),
                    child: TextComponent(
                      'Corte de Cabelo',
                      color: fontColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    width: Get.width * 0.90,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 4),
                      child: TextComponent(
                        'Corte mascúlino, degradê, social, à escolhaaa',
                        color: cinzaPadrao,
                        textOverflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 4),
                    child: TextComponent(
                      'R\$ 25,00',
                      color: fontColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 0,
              child: Column(
                children: [
                  Icon(
                    size: 25,
                    Icons.arrow_forward_ios_outlined,
                    color: fontColor,
                  )
                ],
              ),
            )
          ],
        ),
        const SizedBox(
          height: 4,
        ),
        Divider(
          thickness: 1,
          color: lineColor,
        )
      ],
    );
  }
}
