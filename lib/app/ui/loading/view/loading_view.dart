import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:wapper/app/ui/components/loading_component.dart';
import 'package:wapper/app/ui/components/text_component.dart';
import 'package:wapper/app/ui/loading/controller/loading_controller.dart';
import 'package:wapper/app/ui/theme/styles.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoadingController());
    return WillPopScope(
      onWillPop: null,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: azulPadrao,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LoadingComponent(
                height: 100,
                width: 100,
              ),
              const SizedBox(
                height: 35,
              ),
              Obx(
                (() => TextComponent('Carregando${controller.pontinho.value}', fontSize: 30, fontWeight: FontWeight.bold)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
