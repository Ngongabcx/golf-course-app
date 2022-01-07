import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:gcms/app/modules/Authentication/controllers/auth_controller.dart';
import 'package:gcms/constants/constant.dart';
import 'package:get/get.dart';

class CustomDatePicker extends GetView {
  final _controller = Get.put(AuthenticationController());

  final String name;
  final String label;

  CustomDatePicker({required this.name, required this.label});
  @override
  Widget build(BuildContext context) {
    return FormBuilderDateTimePicker(
      name: name,
      inputType: InputType.date,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(
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
          borderSide: BorderSide(
            color: kPrimaryColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsetsDirectional.fromSTEB(16, 24, 0, 24),
      ),
      style: const TextStyle(
        color: Color(0xFF95A1AC),
        fontSize: 16,
        fontWeight: FontWeight.normal,
      ),
      onChanged: (newSelectedDate) {
        _controller.selectedDate.value = newSelectedDate.toString();
        print(newSelectedDate);
      },
    );
  }
}
