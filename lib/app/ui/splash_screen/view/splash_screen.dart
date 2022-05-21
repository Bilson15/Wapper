import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wapper/app/ui/splash_screen/controller/splash_controller.dart';
import 'package:wapper/app/ui/theme/styles.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SplashScreenController());
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: amareloPadrao,
            image: const DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('lib/app/assets/img/splash.png'),
            ),
          ),
        ),
        const Center(
          child: Text(
            'Wapper',
            style: TextStyle(fontFamily: 'OleoScript', fontSize: 64, decoration: TextDecoration.none, color: Colors.white),
          ),
        )
      ],
    );
  }
}
