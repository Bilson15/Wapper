import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wapper/app/data/model/empresaModel.dart';
import 'package:wapper/app/data/model/pageModel.dart';
import 'package:wapper/app/data/repository/empresaRepository.dart';
import 'package:wapper/app/ui/utils/notificacao.dart';

class HomeController extends GetxController {
  var favorite = false.obs;
  EmpresaRepository empresaRepository = EmpresaRepository();
  RxList<EmpresaModel> listEmpresas = <EmpresaModel>[].obs;
  PageModel pagina = PageModel();
  final scrollController = ScrollController(initialScrollOffset: 0);
  RxnBool loading = RxnBool(false);
  RxnBool loadingUltimosAcessos = RxnBool(false);
  SharedPreferences? prefs;
  Rx<List<String>> empresasIds = Rx<List<String>>([]);
  RxList<EmpresaModel> listUltimosAcessos = <EmpresaModel>[].obs;

  HomeController();

  @override
  void onInit() async {
    await buscarEmpresas();
    getUltimosAcessos();
    buscarEmpresasUltimosAcessos();
    scrollController.addListener(loadMore);
    super.onInit();
  }

  buscarEmpresas() async {
    try {
      loading(true);
      print(pagina.pageNumber);
      List retorno = await empresaRepository.buscarEmpresas(pagina.pageNumber);
      await Future.delayed(Duration(seconds: 1));
      listEmpresas.addAll(retorno[0]);
      pagina = retorno[1];
    } catch (e) {
      Notificacao.snackBar(e.toString(), tipoNotificacao: TipoNotificacaoEnum.error);
    } finally {
      loading(false);
      listEmpresas.refresh();
    }
  }

  loadMore() {
    if (scrollController.position.pixels == scrollController.position.maxScrollExtent && !loading.value!) {
      pagina.more();
      buscarEmpresas();
    }
  }

  saveUltimosAcessos() async {
    prefs = await SharedPreferences.getInstance();
    await prefs?.setStringList('ultimos_acessos', empresasIds.value);
  }

  void getUltimosAcessos() async {
    prefs = await SharedPreferences.getInstance();
    empresasIds.value = prefs?.getStringList('ultimos_acessos') ?? [];
  }

  void buscarEmpresasUltimosAcessos() async {
    getUltimosAcessos();
    loadingUltimosAcessos.value = true;
    listUltimosAcessos.clear();
    try {
      await Future.forEach(empresasIds.value, (String? id) async {
        EmpresaModel? empresaModel = (await empresaRepository.buscarEmpresa(id ?? ''));

        if (empresaModel.id != null) {
          if (!listUltimosAcessos.any((element) => element.id == empresaModel.id)) {
            listUltimosAcessos.add(empresaModel);
            loadingUltimosAcessos.value = false;
            listUltimosAcessos.refresh();
          }
        }
      });
    } catch (e) {
      print('eeeee ${e}');
    } finally {
      loadingUltimosAcessos.value = false;
    }
  }
}
