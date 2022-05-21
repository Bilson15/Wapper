import 'package:get/get.dart';
import 'package:wapper/app/ui/home_page/view/home_page.dart';
import 'package:wapper/app/ui/loading/view/loading_view.dart';
import 'package:wapper/app/ui/login_page/view/login.dart';
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
  ];
}
