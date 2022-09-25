import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wapper/app/routes/app_routes.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: 'Wapper',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: AppRoutes.routes,
    ),
  );
}
