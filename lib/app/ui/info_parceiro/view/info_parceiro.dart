import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:wapper/app/ui/components/app_bar_component.dart';
import 'package:wapper/app/ui/components/text_component.dart';

class InfoParceiro extends StatelessWidget {
  const InfoParceiro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent(
        textComponent: const TextComponent(
          'Barbearia do Zé',
          fontWeight: FontWeight.w600,
        ),
      ),
      body: Container(),
    );
  }
}