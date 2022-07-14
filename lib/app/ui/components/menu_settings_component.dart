import 'package:flutter/material.dart';

import 'package:wapper/app/ui/components/text_component.dart';

import '../theme/styles.dart';

class MenuSettingsComponent extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  const MenuSettingsComponent({Key? key, required this.title, required this.subtitle, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              icon,
              color: amareloPadrao,
              size: 40,
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextComponent(
                  title,
                  fontSize: 20,
                  color: fontColor,
                ),
                TextComponent(
                  subtitle,
                  fontSize: 15,
                  color: cinzaPadrao,
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            )
          ],
        ),
        Divider(
          thickness: 1,
          color: lineColor,
        ),
      ],
    );
  }
}
