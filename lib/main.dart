import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wapper/app/routes/app_routes.dart';
import 'package:wapper/app/ui/theme/styles.dart';

void main() {
  runApp(
    GetMaterialApp(
      theme: ThemeData(
        accentColor: cinzaPadrao,
        cursorColor: lineColor,
      ),
      title: 'Wapper',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: AppRoutes.routes,
    ),
  );
}
