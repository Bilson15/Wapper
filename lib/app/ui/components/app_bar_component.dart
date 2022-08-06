import 'package:flutter/material.dart';

import 'package:wapper/app/ui/components/text_component.dart';
import 'package:wapper/app/ui/theme/styles.dart';

class AppBarComponent extends StatelessWidget implements PreferredSizeWidget {
  final TextComponent textComponent;
  Widget? action;
  AppBarComponent({
    Key? key,
    required this.textComponent,
    this.action,
  }) : super(key: key);
  final AppBar appBar = AppBar();

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(50.0),
      child: AppBar(
        centerTitle: true,
        backgroundColor: azulPadrao,
        title: textComponent,
        actions: [
          action ?? SizedBox.shrink(),
        ],
      ),
    );
  }
}
