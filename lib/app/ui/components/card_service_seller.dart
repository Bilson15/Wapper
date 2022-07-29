import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wapper/app/ui/components/text_component.dart';
import 'package:wapper/app/ui/theme/styles.dart';

// ignore: must_be_immutable
class CardServiceSeller extends StatelessWidget {
  String? title;
  String? description;
  String? value;
  bool? icon;

  CardServiceSeller({this.title, this.description, this.value, this.icon = false, Key? key}) : super(key: key);

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
                      title ?? '',
                      color: fontColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    width: Get.width * 0.90,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 4),
                      child: TextComponent(
                        description ?? '',
                        color: cinzaPadrao,
                        textOverflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 4),
                    child: TextComponent(
                      value ?? '',
                      color: fontColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            icon ?? false
                ? Expanded(
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
                : SizedBox.shrink(),
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
