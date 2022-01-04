import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:gcms/app/modules/Authentication/controllers/auth_controller.dart';
import 'package:gcms/constants/constant.dart';

import 'package:get/get.dart';

class BuildFormBuilderDateTimePickerView extends GetView {
 final AuthenticationController _controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return FormBuilderDateTimePicker(
      name: 'Birthday',
      inputType: InputType.date,
      decoration: InputDecoration(
        labelText: 'Date of Birth',
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