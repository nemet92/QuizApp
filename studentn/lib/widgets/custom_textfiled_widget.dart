import 'package:flutter/material.dart';

import '../utils/themes/theme.dart';

class CustomTextFieldWidget extends StatelessWidget {
  const CustomTextFieldWidget({
    Key? key,
    required this.textEditingController,
    required bool validate,
    required this.errorText,
    required this.labelText,
    this.labelStyle,
    this.obscureText = false,
    this.maxLength = null,
    this.suffixIcon = null,
    this.prefixIcon = null,
    this.keyboardType = TextInputType.number,
    this.inputFormatters = false,
  })  : _validate = validate, // bu ne ucundu?
        super(key: key);

  final TextEditingController textEditingController;
  final bool _validate;
  final String errorText;
  final dynamic labelStyle;
  final String? labelText;
  final bool obscureText;
  final int? maxLength;
  final Widget? suffixIcon;
  final Icon? prefixIcon;
  final dynamic keyboardType;
  final dynamic? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.center,
      controller: textEditingController,
      obscureText: obscureText,
      maxLength: maxLength,
      keyboardType: keyboardType,
      inputFormatters: null,
      decoration: InputDecoration(
          prefixIcon: prefixIcon,
          errorText: _validate ? errorText : null,
          labelStyle: null,
          suffixIcon: suffixIcon,
          labelText: labelText,
          hintStyle: TextStyle(color: Colors.grey),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Themes.primaryColor, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Themes.primaryColor, width: 1)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Themes.errorColor, width: 1)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Themes.primaryColor, width: 1))),
    );
  }
}
