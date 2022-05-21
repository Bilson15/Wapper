import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wapper/app/ui/components/text_component.dart';
import 'package:wapper/app/ui/theme/styles.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: TextButton(
          onPressed: () {
            Get.offAllNamed('login');
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(fontColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
            ),
          ),
          child: const TextComponent(
            'Voltar',
            fontSize: 40,
          ),
        ),
      ),
    );
  }
}
