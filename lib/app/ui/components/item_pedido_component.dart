import 'package:flutter/material.dart';
import 'package:wapper/app/ui/components/text_component.dart';
import 'package:wapper/app/ui/theme/styles.dart';

class ItemPedidoComponent extends StatelessWidget {
  int? quantidade;
  String? descricao;
  double? valor;
  String? date;
  String? profissional;
  ItemPedidoComponent({Key? key, this.quantidade, this.descricao, this.valor, this.date, this.profissional}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          thickness: 1,
          color: lineColor,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: TextComponent(
                  '$quantidade',
                  color: cinzaPadrao,
                ),
              ),
              Expanded(
                flex: 4,
                child: TextComponent(
                  '$descricao',
                  color: cinzaPadrao,
                ),
              ),
              Expanded(
                flex: 1,
                child: TextComponent(
                  'R\$ $valor',
                  color: cinzaPadrao,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 0,
                  child: TextComponent(
                    'Horário: ',
                    color: fontColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Expanded(
                  child: TextComponent('$date', color: cinzaPadrao),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Expanded(
                  flex: 0,
                  child: TextComponent(
                    'Profissional: ',
                    color: fontColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Expanded(
                  child: TextComponent('${profissional}', color: cinzaPadrao),
                ),
              ],
            )
          ],
        ),
        Divider(
          thickness: 1,
          color: lineColor,
        )
      ],
    );
  }
}
