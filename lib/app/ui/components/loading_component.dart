import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:wapper/app/ui/theme/styles.dart';

class LoadingComponent extends StatelessWidget {
  double? height;
  double? width;

  LoadingComponent({Key? key, this.height, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: height ?? 50,
          width: width ?? 50,
          child: CircularProgressIndicator(
            strokeWidth: 7,
            color: backgroundFieldColor,
          ),
        ),
      ],
    );
  }
}
