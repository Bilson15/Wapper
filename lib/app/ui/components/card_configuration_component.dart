import 'package:flutter/material.dart';
import 'package:wapper/app/ui/components/text_component.dart';
import 'package:wapper/app/ui/theme/styles.dart';

class CardConfigurationComponent extends StatelessWidget {
  final String title;
  final IconData icon;

  const CardConfigurationComponent({Key? key, required this.title, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Column(
        children: [
          Divider(
            thickness: 1,
            color: lineColor,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: TextComponent(
                  title,
                  fontSize: 20,
                  color: fontColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Icon(
                  icon,
                ),
              ),
            ],
          ),
          Divider(
            thickness: 1,
            color: lineColor,
          ),
        ],
      ),
    );
  }
}
