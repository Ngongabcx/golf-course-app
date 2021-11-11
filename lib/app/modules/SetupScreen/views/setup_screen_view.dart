import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:gcms/app/components/submit_button.dart';
import 'package:gcms/app/modules/ActiveGameScreen/views/select_holes_card.dart';
import 'package:gcms/constants/constant.dart';
import 'package:gcms/theme/gcms_theme.dart';

import 'package:get/get.dart';
import 'package:dropdown_search/dropdown_search.dart';

import '../controllers/setup_screen_controller.dart';
class SetupScreenView extends GetView<SetupScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        automaticallyImplyLeading: true,
        title: Align(
          alignment: const AlignmentDirectional(-1, 0),
          child: Text(
            ' Match Setup',
            style: Theme.of(context).textTheme.headline3,
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: const BorderSide(
                        color: Color(0xFF22C17B),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: const BorderSide(
                        color: Color(0xFF9C9D9E),
                      ),
                    ),
                    labelText: 'Match Name',
                    labelStyle: Theme.of(context).textTheme.headline3),
              ),
              const SizedBox(height: 20),
              Text(
                'Select Golf Course',
                style: Theme.of(context).textTheme.headline3,
              ),
              const SizedBox(height: 20),
              DropdownSearch<String>(
                  mode: Mode.MENU,
                  showSearchBox: true,
                  items: controller.courses,
                  label: "Select Course",
                  hint: "country in menu mode",
                  popupItemDisabled: (String s) => s.startsWith('I'),
                  onChanged: print,
                  selectedItem: "Chinama Golf Course"),
              const SizedBox(height: 20),
              Text(
                'Player Setup',
                style: Theme.of(context).textTheme.headline3,
              ),
              const SizedBox(height: 16),
              DropdownSearch<String>.multiSelection(
                autoValidateMode: AutovalidateMode.always,
                showClearButton: true,
                showSearchBox: true,
                mode: Mode.MENU,
                items: controller.playersList,
                label: "Invite Players",
                hint: "Player in menu mode",
                popupItemDisabled: (String s) => s.startsWith('I'),
                onChanged: print,
                selectedItems: ["Tiger Woods"],
              ),
              const SizedBox(height: 20),
              Text('Select Holes',
                  style: Theme.of(context).textTheme.headline3),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SelectHolesCard(
                    onPress: () {
                       controller.selectedHole.value = 9;
                    },
                    color: controller.selectedHole.value == 9
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: Text(
                        '9 Holes',
                        style: Theme.of(context).textTheme.bodyText1,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SelectHolesCard(
                    onPress: () {
                       controller.selectedHole.value = 18;
                    },
                    color: controller.selectedHole.value == 18
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: Text(
                        '18 Holes',
                        style: Theme.of(context).textTheme.bodyText1,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DropdownButton<int>(
                    hint: Text(
                      'Start from',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    items: controller.hole9options.map((int value) {
                      return DropdownMenuItem<int>(
                        value: value,
                        child: Text(value.toString()),
                      );
                    }).toList(),
                    onChanged: (int newSelectedHole) {
                      controller.selectedHole.value = newSelectedHole;
                    },
                  ),
                  DropdownButton<int>(
                    hint: Text(
                      'End At',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    items: controller.hole18options.map((int value) {
                      return DropdownMenuItem<int>(
                        value: value,
                        child: Text(value.toString()),
                      );
                    }).toList(),
                    onChanged: (_) {},
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      onPressed: () {
                        DatePicker.showDatePicker(context,
                            theme: const DatePickerTheme(
                              containerHeight: 210.0,
                            ),
                            showTitleActions: true,
                            minTime: DateTime(2000, 1, 1),
                            maxTime: DateTime(2022, 12, 31), onConfirm: (date) {
                          print('confirm $date');
                          controller.date = '${date.year} - ${date.month} - ${date.day}';
                        }, currentTime: DateTime.now(), locale: LocaleType.en);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      const Icon(
                                        Icons.date_range,
                                        size: 18.0,
                                        color: Color(0xFF9C9D9E),
                                      ),
                                      Text(
                                        " $controller.date",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Text(
                              "  Change",
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                          ],
                        ),
                      ),
                      color: Colors.white,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      elevation: 4.0,
                      onPressed: () {
                        DatePicker.showTimePicker(context,
                            theme: const DatePickerTheme(
                              containerHeight: 210.0,
                            ),
                            showTitleActions: true, onConfirm: (time) {
                          print('confirm $time');
                          controller.time =
                              '${time.hour} : ${time.minute} : ${time.second}';

                        }, currentTime: DateTime.now(), locale: LocaleType.en);

                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      const Icon(
                                        Icons.access_time,
                                        size: 18.0,
                                        color: Color(0xFF9C9D9E),
                                      ),
                                      Text(" $controller.time",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText2),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Text(
                              "  Change",
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                          ],
                        ),
                      ),
                      color: Colors.white,
                    )
                  ],
                ),
              ),
              const SizedBox(height: 50),
              Expanded(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: SubmitButton(
                      text: ('View Match'),
                      style: GcmsTheme.lightTextTheme.bodyText2,
                      onPressed: () {
                        Get.toNamed("/scores-input-screen");
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
