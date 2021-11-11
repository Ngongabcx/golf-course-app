import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CustomTextFormFieldWidget extends GetView {
  final TextEditingController textEditingController;
  final String label;
  final Function onValidate;
  final bool isObscure;
  final bool isNumber;
  final bool isEmail;
  CustomTextFormFieldWidget(
    this.textEditingController,
    this.label,
    this.onValidate,
    this.isObscure,
    this.isNumber,
    this.isEmail,
  );
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      keyboardType: isNumber
          ? TextInputType.number
          : isEmail
              ? TextInputType.emailAddress
              : TextInputType.text,
      validator: onValidate,
      obscureText: isObscure,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(
          fontFamily: 'Lexend Deca',
          color: Color(0xFF95A1AC),
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFFDBE2E7),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFF22c17b),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsetsDirectional.fromSTEB(16, 24, 0, 24),
      ),
      style: const TextStyle(
        fontFamily: 'Lexend Deca',
        color: Color(0xFF2B343A),
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
