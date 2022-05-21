import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wapper/app/ui/theme/styles.dart';

class Notificacao {
  static void snackBar(String msg, {TipoNotificacaoEnum? tipoNotificacao}) {
    Get.snackbar(
      'Mensagem',
      msg,
      colorText: backgroundFieldColor,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: tipoNotificacaoColor(tipoNotificacao),
      borderRadius: 5,
      margin: const EdgeInsets.only(left: 20, bottom: 20, right: 20),
    );
  }

  static tipoNotificacaoColor(value) {
    switch (value) {
      case TipoNotificacaoEnum.error:
        return errorColor;
      case TipoNotificacaoEnum.info:
        {
          return amareloPadrao;
        }
      default:
        return azulPadrao;
    }
  }
}

enum TipoNotificacaoEnum { error, info, sucess }
