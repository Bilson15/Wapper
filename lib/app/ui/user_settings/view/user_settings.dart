import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:wapper/app/ui/components/text_component.dart';
import 'package:wapper/app/ui/theme/styles.dart';
import 'package:wapper/app/ui/utils/utils.dart';

class UserSettings extends StatelessWidget {
  const UserSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: Utils.paddingSafeAreaTop(context),
          ),
          Row(
            children: [
              Container(
                width: 55,
                height: 55,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image:
                        NetworkImage("https://img.freepik.com/vetores-gratis/logotipo-do-polo-de-barbeiro_1415-673.jpg?w=2000"),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextComponent(
                  'Barbearia do Zé',
                  color: black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
