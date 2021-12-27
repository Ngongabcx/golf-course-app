import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:gcms/app/modules/SetupScreen/controllers/setup_screen_controller.dart';
import 'package:gcms/constants/constant.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/state_manager.dart';

class CustomDropDownMultiSelect extends GetView {
  final String label;
  final String hint;
  final bool showClearButton;
  final bool showSearchField;
  final List<String> itemList;
  SetupScreenController _controller = Get.find();

  CustomDropDownMultiSelect(
    this.label,
    this.hint,
    this.showClearButton,
    this.showSearchField,
    this.itemList,
  );
  @override
  Widget build(BuildContext context) {
    return DropdownSearch<String>.multiSelection(
        autoValidateMode: AutovalidateMode.always,
        showClearButton: showClearButton,
        mode: Mode.BOTTOM_SHEET,
        showSearchBox: showSearchField,
        items: itemList,
        label: label,
        hint: hint,
        popupItemDisabled: (String s) => s.startsWith('I'),
        dropdownSearchDecoration: InputDecoration(
          constraints: BoxConstraints(maxHeight: 60.0),
          isDense: true,
          isCollapsed: false,
          labelText: label,
          labelStyle: TextStyle(color: Colors.grey),
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
          _controller.selectedPlayers.clear();
          for (int i = 0; i < value.length; i++) {
            var _players = _controller.lstPlayers
                .where((v) => v.firstName == value[i])
                .toList();
            print(i);
            print(value[i]);
            _controller.selectedPlayers.add(_players[0].id);
            print("FILTERED ITEM PLAYERS ----> ${_players[0].id}");
          }
          print("FILTERED ITEM ID ----> ${_controller.selectedPlayers}");
        }
        //selectedItems: ["Tiger Woods"],
        );
  }
}
