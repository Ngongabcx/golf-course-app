import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:gcms/app/modules/SetupScreen/controllers/setup_screen_controller.dart';
import 'package:gcms/constants/constant.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/state_manager.dart';

class CustomDropDown extends GetView {
  final String label;
  final String hint;
  final bool showSearchField;
  final List<String> itemList;
  SetupScreenController _controller = Get.find();

  CustomDropDown(
    this.label,
    this.hint,
    this.showSearchField,
    this.itemList,
  );
  @override
  Widget build(BuildContext context) {
    return DropdownSearch<String>(
      mode: Mode.BOTTOM_SHEET,
      showSearchBox: showSearchField,
      items: itemList,
      label: label,
      hint: hint,
      popupBackgroundColor: Colors.white,
      popupItemDisabled: (String s) => s.startsWith('I'),
      dropdownSearchDecoration: InputDecoration(
        constraints: BoxConstraints(maxHeight: 70.0),
        isDense: true,
        isCollapsed: false,
        labelText: label,
        labelStyle: TextStyle(
          color: Color(0xFF95A1AC),
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
            color: kPrimaryColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onChanged: (value) {
        print("FILTERED ITEM TEST ----> ");
        var _courses = _controller.lstCourses
            .takeWhile((i) => i.courseName == value)
            .toList();
        print("FILTERED ITEM ID ----> ${_courses.first.id}");
        _controller.selectedCourseId.value = _courses.first.id.toString();
      },
      //selectedItem: "123456",
    );
  }
}
