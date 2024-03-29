import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wapper/app/ui/components/menu_settings_component.dart';
import 'package:wapper/app/ui/components/text_component.dart';
import 'package:wapper/app/ui/theme/styles.dart';
import 'package:wapper/app/ui/user_settings/controller/user_settings.dart';
import 'package:wapper/app/ui/utils/utils.dart';

class UserSettings extends StatelessWidget {
  const UserSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<UserSettingsController>(tag: 'user_settings');
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
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
                      image: NetworkImage("https://cdn.iconscout.com/icon/free/png-256/avatar-370-456322.png"),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextComponent(
                    '${controller.cartController.clienteLogado.value?.nome ?? ''}',
                    color: black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {},
              child: const MenuSettingsComponent(
                icon: Icons.pin_drop_outlined,
                title: 'Endereço',
                subtitle: 'Meu Endereço Cadastrado',
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: const MenuSettingsComponent(
                icon: Icons.person_outlined,
                title: 'Meus dados',
                subtitle: 'Minhas informações da conta',
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed('/app-configuration');
              },
              child: const MenuSettingsComponent(
                icon: Icons.settings_outlined,
                title: 'Configurações',
                subtitle: 'Logout, informações, versões',
              ),
            )
          ],
        ),
      ),
    );
  }
}
