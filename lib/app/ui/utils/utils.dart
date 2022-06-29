import 'package:flutter/material.dart';

class Utils {
  static paddingSafeAreaTop(context) {
    return EdgeInsets.only(top: MediaQuery.of(context).padding.top);
  }
}
