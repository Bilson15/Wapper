import 'package:flutter/material.dart';
import 'package:wapper/app/ui/components/text_component.dart';
import 'package:wapper/app/ui/theme/styles.dart';

class DropDownComponent extends StatelessWidget {
  final String? label;
  final Icon? icon;
  final String? hintText;
  final Function? onChanged;
  final Function? validator;
  final List<DropdownMenuItem<dynamic>> items;
  const DropDownComponent({
    Key? key,
    this.label,
    this.icon,
    this.hintText,
    this.onChanged,
    required this.items,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    return Container(
      decoration: BoxDecoration(color: lineColor, borderRadius: BorderRadius.circular(15.0)),
      child: DropdownButtonFormField<dynamic>(
        isExpanded: true,
        dropdownColor: lineColor,
        style: TextStyle(
          color: fontColor,
          fontSize: 16 * media.textScaleFactor,
          fontStyle: FontStyle.normal,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: 15, bottom: 10, left: 10, right: 10),
          hintText: hintText,
          prefixIcon: icon,
          hintStyle: TextStyle(
              color: Colors.black,
              fontSize: 16 * media.textScaleFactor,
              letterSpacing: 0.15,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w500),
          border: InputBorder.none,
          isDense: true,
        ),
        validator: (value) {
          if (validator != null) {
            return validator!(value);
          }
        },
        borderRadius: BorderRadius.circular(15.0),
        items: items,
        onChanged: (value) => onChanged!(value),
      ),
    );
  }
}
