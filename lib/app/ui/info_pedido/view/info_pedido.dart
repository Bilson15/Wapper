import 'package:flutter/material.dart';
import 'package:wapper/app/ui/components/app_bar_component.dart';
import 'package:wapper/app/ui/components/text_component.dart';

class InfoPedido extends StatelessWidget {
  const InfoPedido({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent(
        textComponent: const TextComponent(
          'Detalhes do Pedido',
          fontWeight: FontWeight.w600,
        ),
      ),
      body: Container(),
    );
  }
}
