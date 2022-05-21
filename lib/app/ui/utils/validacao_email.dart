import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wapper/app/ui/theme/styles.dart';

class ValidacaoEmail {
  static validarEmail(String value) {
    String pattern = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    bool valida = RegExp(pattern).hasMatch(value);
    return valida;
  }
}
