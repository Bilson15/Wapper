import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:wapper/app/ui/home_page/view/home_page.dart';
import 'package:wapper/app/ui/pedidos/view/historico_pedidos.dart';
import 'package:wapper/app/ui/search_page.dart/view/search_page.dart';
import 'package:wapper/app/ui/user_settings/view/user_settings.dart';

class RootController extends GetxController {
  final currentIndex = 0.obs;

  final List<Widget> pages = [
    const HomePage(),
    const SearchPage(),
    const HistoricoPedidos(),
    const UserSettings(),
  ];

  RootController();

  void changePage(int index) {
    currentIndex(index);
  }

  Widget currentePage() {
    return pages[currentIndex.value];
  }
}
