import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wapper/app/ui/components/text_component.dart';
import 'package:wapper/app/ui/theme/styles.dart';

import '../../components/appbar/app_bar_component.dart';
import '../../utils/utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: Utils.paddingSafeAreaTop(context),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextComponent(
                  'R. 19-D, 839',
                  color: cinzaPadrao,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
                child: TextComponent(
                  'Últimos acessos',
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: fontColor,
                ),
              ),
            ],
          )
        ],
      ),
      bottomNavigationBar: AppBarComponent(0),
    );
  }
}
