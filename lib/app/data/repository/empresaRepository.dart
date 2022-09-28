import 'dart:convert';

import 'package:wapper/app/data/model/empresaModel.dart';
import 'package:wapper/app/data/model/pageModel.dart';
import 'package:wapper/app/ui/shared/ApiService.dart';

class EmpresaRepository {
  late ApiService api;

  EmpresaRepository() {
    api = ApiService();
  }

  Future<List> buscarEmpresas(int pagina) async {
    Map<String, String> queryParameters = {
      'page': pagina.toString(),
    };

    var response = await api.get('/empresa', queryParameters: queryParameters);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      List<EmpresaModel> empresas = data['content'].map<EmpresaModel>((data) => EmpresaModel.fromJson(data)).toList();

      PageModel pagina = PageModel.fromJson(data['pageable']);
      return [empresas, pagina];
    } else {
      var error = json.decode(response.body)['error'];
      throw error;
    }
  }

  Future<EmpresaModel> buscarEmpresa(String idEmpresa) async {
    var response = await api.get(
      '/empresa/${idEmpresa}',
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      EmpresaModel empresa = EmpresaModel.fromJson(data);

      return empresa;
    } else {
      var error = json.decode(response.body)['error'];
      throw error;
    }
  }
}
