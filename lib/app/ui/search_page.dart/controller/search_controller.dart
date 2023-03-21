import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:wapper/app/data/model/empresaModel.dart';
import 'package:wapper/app/data/model/pageModel.dart';
import 'package:wapper/app/data/repository/empresaRepository.dart';

class SearchController extends GetxController {
  EmpresaRepository empresaRepository = EmpresaRepository();
  final listEmpresas = RxList<EmpresaModel>([]);
  TextEditingController termController = TextEditingController();
  PageModel pagina = PageModel();
  final scrollController = ScrollController(initialScrollOffset: 0);
  RxBool loading = RxBool(false);

  @override
  void onInit() async {
    // scrollController.addListener(loadMore);
    super.onInit();
  }

  searchTerm({bool update = false}) async {
    try {
      loading(true);

      if (update) {
        listEmpresas.clear();
        pagina.pageNumber = 0;
      }

      List retorno = await empresaRepository.buscaPorTermo(termController.text, pagina.pageNumber);
      await Future.delayed(Duration(seconds: 1));
      if (update) {
        listEmpresas.value = (retorno[0] as List<EmpresaModel>);
      } else {
        listEmpresas.addAll((retorno[0] as List<EmpresaModel>));
      }

      pagina = retorno[1];
    } catch (e) {
      print(e.toString());
    } finally {
      listEmpresas.refresh();
      loading(false);
    }
  }

  loadMore() {
    if (scrollController.position.pixels == scrollController.position.maxScrollExtent && !loading.value) {
      pagina.more();
      searchTerm();
    }
  }
}
