import 'package:flutter/material.dart';
import 'package:wapper/app/ui/components/card_client_component.dart';
import 'package:wapper/app/ui/components/form_field_component.dart';
import 'package:wapper/app/ui/theme/styles.dart';
import 'package:wapper/app/ui/utils/utils.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: Utils.paddingSafeAreaTop(context),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: InputFormFieldComponent(
              initialValue: 'Digite o nome de um parceiro',
              prefixIcon: Icon(
                Icons.search,
                color: azulPadrao,
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: ListView.builder(
                controller: ScrollController(initialScrollOffset: 0),
                itemCount: 15,
                itemBuilder: (context, index) {
                  return CardClientComponent();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
