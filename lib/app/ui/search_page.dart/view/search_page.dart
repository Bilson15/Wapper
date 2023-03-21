import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wapper/app/ui/components/card_client_component.dart';
import 'package:wapper/app/ui/components/form_field_component.dart';
import 'package:wapper/app/ui/search_page.dart/controller/search_controller.dart';
import 'package:wapper/app/ui/theme/styles.dart';
import 'package:wapper/app/ui/utils/utils.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SearchController>(tag: 'search_controller');
    return Obx(
      () => Scaffold(
        body: Column(
          children: [
            Padding(
              padding: Utils.paddingSafeAreaTop(context),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: InputFormFieldComponent(
                controller: controller.termController,
                hintText: 'Digite o nome de um parceiro',
                onChanged: (value) {
                  if (controller.termController.text.length > 3) {
                    controller.searchTerm(update: true);
                  }
                },
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
                  controller: controller.scrollController,
                  itemCount: controller.listEmpresas.length,
                  itemBuilder: (context, index) {
                    return CardClientComponent(
                      empresa: controller.listEmpresas[index],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
