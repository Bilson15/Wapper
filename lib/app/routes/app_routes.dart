import 'package:get/get.dart';
import 'package:wapper/app/ui/app_configuration/view/app_configuration.dart';
import 'package:wapper/app/ui/cadastro/view/cadastro_cliente.dart';
import 'package:wapper/app/ui/cadastro/view/cadastro_dados_pessoais.dart';
import 'package:wapper/app/ui/feedback_service/view/feedback_page.dart';
import 'package:wapper/app/ui/home_page/view/home_page.dart';
import 'package:wapper/app/ui/info_parceiro/view/info_parceiro.dart';
import 'package:wapper/app/ui/info_pedido/view/info_pedido.dart';
import 'package:wapper/app/ui/loading/view/loading_view.dart';
import 'package:wapper/app/ui/login_page/view/login.dart';
import 'package:wapper/app/ui/root/view/root.dart';
import 'package:wapper/app/ui/search_page.dart/view/search_page.dart';
import 'package:wapper/app/ui/service_parceiro/view/service_parceiro.dart';
import 'package:wapper/app/ui/splash_screen/view/splash_screen.dart';

class AppRoutes {
  static final routes = [
    GetPage(
      name: '/',
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: '/home',
      page: () => const HomePage(),
    ),
    GetPage(
      name: '/login',
      page: () => const Login(),
    ),
    GetPage(
      name: '/loading',
      page: () => const LoadingView(),
    ),
    GetPage(
      name: '/cadastro',
      page: () => const CadastroCliente(),
    ),
    GetPage(
      name: '/cadastro-dados-pessoais',
      page: () => const CadastroDadosPessoais(),
    ),
    GetPage(
      name: '/search',
      page: () => const SearchPage(),
    ),
    GetPage(
      name: '/root/:index',
      page: () => Root(
        index: int.parse(Get.parameters['index']!),
      ),
    ),
    GetPage(
      name: '/app-configuration',
      page: () => const AppConfiguration(),
    ),
    GetPage(
      name: '/info-pedido',
      page: () => const InfoPedido(),
    ),
    GetPage(
      name: '/feedback-page',
      page: () => FeedBackPage(),
    ),
    GetPage(
      name: '/info-parceiro',
      page: () => InfoParceiro(),
    ),
    GetPage(
      name: '/servico-parceiro',
      page: () => ServicoParceiro(),
    )
  ];
}
