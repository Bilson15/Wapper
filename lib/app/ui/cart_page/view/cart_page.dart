import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:wapper/app/ui/components/app_bar_component.dart';
import 'package:wapper/app/ui/components/text_component.dart';
import 'package:wapper/app/ui/theme/styles.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent(
        textComponent: const TextComponent(
          'Meu Carrinho',
          fontWeight: FontWeight.w600,
        ),
        action: IconButton(
          icon: Icon(
            Icons.remove_shopping_cart_outlined,
            color: backgroundFieldColor,
          ),
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          tooltip: 'Cancelar carrinho',
          onPressed: () {
            // handle the press
          },
        ),
      ),
      body: Container(),
    );
  }
}
