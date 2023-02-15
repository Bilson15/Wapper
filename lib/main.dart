import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wapper/app/routes/app_routes.dart';
import 'package:wapper/app/ui/cart_page/controller/cart_controller.dart';

void main() {
  Get.put(CartController(), tag: 'cart_controller', permanent: true);

  runApp(
    GetMaterialApp(
      title: 'Wapper',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: AppRoutes.routes,
    ),
  );
}
