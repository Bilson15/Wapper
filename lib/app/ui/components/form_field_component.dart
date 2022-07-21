import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../theme/styles.dart';

class InputFormFieldComponent extends StatelessWidget {
  final String? label;
  final String? errorText;
  final String? initialValue;
  final String? prefixText;
  final int? maxLength;
  final Function? onSaved;
  final Function? validator;
  final Function? onChanged;
  final Function? onFieldSubmitted;
  final String? hintText;
  final Icon? prefixIcon;
  final dynamic suffixIcon;
  final bool? obscureText;
  final bool? enable;
  final TextInputType? keyboardType;
  final int? maxLines;
  final List<TextInputFormatter>? inputFormatter;
  final TextEditingController? controller;
  final bool? readOnly;
  final bool? autofocus;
  final InputDecoration? decoration;
  final double? height;
  final TextStyle? textStyle;
  final FocusNode? focusNode;
  final Color? fillColor;
  final counterText;

  InputFormFieldComponent({
    Key? key,
    this.label,
    this.initialValue,
    this.maxLength,
    this.onSaved,
    this.validator,
    this.onChanged,
    this.onFieldSubmitted,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText,
    this.enable,
    this.keyboardType,
    this.maxLines,
    this.inputFormatter,
    this.controller,
    this.readOnly,
    this.autofocus,
    this.decoration,
    this.prefixText,
    this.errorText,
    this.height,
    this.textStyle,
    this.focusNode,
    this.fillColor,
    this.counterText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: autofocus ?? false,
      controller: controller,
      focusNode: focusNode,
      inputFormatters: inputFormatter,
      maxLines: maxLines ?? 1,
      enabled: enable ?? true,
      initialValue: initialValue,
      readOnly: readOnly ?? false,
      obscureText: obscureText ?? false,
      maxLength: maxLength,
      onFieldSubmitted: (value) => {
        if (onFieldSubmitted != null) {onFieldSubmitted!(value)}
      },
      onChanged: (value) => {
        if (onChanged != null) {onChanged!(value)}
      },
      onSaved: (value) => {
        if (onSaved != null) {onSaved!(value)}
      },
      validator: (value) {
        if (validator != null) {
          return validator!(value);
        }
      },
      keyboardType: keyboardType,
      style: textStyle,
      cursorColor: fontColor,
      decoration: InputDecoration(
        hintStyle: TextStyle(
          fontFamily: 'Roboto',
          color: cinzaPadrao,
        ),
        errorText: errorText,
        prefixText: prefixText,
        errorMaxLines: 2,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        counterText: counterText! ? null : '',
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(15.0),
        ),
        filled: true,
        fillColor: fillColor ?? backgroundFieldColor,
        contentPadding: const EdgeInsets.only(
          top: 5,
          bottom: 10,
          left: 10,
        ),
      ),
    );
  }
}
