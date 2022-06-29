import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:wapper/app/ui/components/appbar/app_bar_controller.dart';
import 'package:wapper/app/ui/theme/styles.dart';

class AppBarComponent extends StatelessWidget {
  int selecionado;
  AppBarComponent(this.selecionado, {Key? key}) : super(key: key);
  final controller = Get.put(AppBarController());

  @override
  Widget build(BuildContext context) {
    controller.selecionado(selecionado);
    return Obx(() => BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              label: 'Home',
              backgroundColor: azulPadrao,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.search),
              label: 'Buscar',
              backgroundColor: azulPadrao,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.post_add),
              label: 'Pedidos',
              backgroundColor: azulPadrao,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.person),
              label: 'Perfil',
              backgroundColor: azulPadrao,
            ),
          ],
          currentIndex: controller.selecionado.value,
          onTap: controller.seleciona,
          selectedItemColor: amareloPadrao,
        ));
  }
}
