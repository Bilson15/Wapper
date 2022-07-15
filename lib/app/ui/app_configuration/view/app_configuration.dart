import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wapper/app/ui/components/app_bar_component.dart';
import 'package:wapper/app/ui/components/card_configuration_component.dart';
import 'package:wapper/app/ui/components/text_component.dart';

class AppConfiguration extends StatelessWidget {
  const AppConfiguration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent(
          textComponent: const TextComponent(
        'Configurações',
        fontWeight: FontWeight.w600,
      )),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            GestureDetector(
              onTap: () {},
              child: const CardConfigurationComponent(
                title: 'Sobre esta versão',
                icon: Icons.arrow_forward_ios_outlined,
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: const CardConfigurationComponent(
                icon: Icons.arrow_forward_ios_outlined,
                title: 'Avaliar o aplicativo',
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.offAllNamed('/home');
              },
              child: const CardConfigurationComponent(
                icon: Icons.logout,
                title: 'Sair',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
