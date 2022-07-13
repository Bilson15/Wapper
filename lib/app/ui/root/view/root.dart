import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wapper/app/ui/root/controller/root_controller.dart';
import 'package:wapper/app/ui/theme/styles.dart';

class Root extends StatelessWidget {
  const Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RootController());
    return Obx(
      () => Scaffold(
        body: controller.currentePage(),
        bottomNavigationBar: BottomNavigationBar(
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
          currentIndex: controller.currentIndex.value,
          onTap: controller.changePage,
          selectedItemColor: amareloPadrao,
        ),
      ),
    );
  }
}
