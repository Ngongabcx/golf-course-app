import 'package:flutter/material.dart';
import 'package:gcms/app/modules/SettingScreen/views/setting_screen_view.dart';
import 'package:gcms/app/modules/SetupScreen/competition_request_model.dart';
import 'package:gcms/app/modules/SetupScreen/controllers/setup_screen_controller.dart';
import 'package:gcms/app/modules/commonWidgets/CustomTimePicker.dart';
import 'package:gcms/app/modules/commonWidgets/customButton.dart';
import 'package:gcms/app/modules/commonWidgets/custom_appbar.dart';
import 'package:gcms/app/modules/commonWidgets/custom_date_time_picker.dart.dart';
import 'package:gcms/app/modules/commonWidgets/custom_multi_select_drop_down.dart';
import 'package:gcms/app/modules/commonWidgets/custom_single_select_drop_down.dart';
import 'package:gcms/app/modules/commonWidgets/list_number_dropdown.dart';
import 'package:gcms/app/modules/commonWidgets/loader/loader.dart';
import 'package:gcms/app/modules/commonWidgets/loader/loading_provider.dart';
import 'package:gcms/app/modules/commonWidgets/textFormField.dart';
import 'package:gcms/constants/constant.dart';
import 'package:gcms/theme/gcms_theme.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:provider/src/provider.dart';

class MatchSetupView extends StatelessWidget {
  final _controller = Get.put(SetupScreenController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: kBackgroundColor,
        body: _controller.isProcessing.value == true
            ? Loader()
            : Column(
                children: [
                  CustomAppBar(
                    Icons.arrow_back_ios_outlined,
                    Icons.settings_outlined,
                    leftCallBack: () => Get.back(),
                    rightCallBack: () => Get.to(SettingScreenView()),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    margin: EdgeInsets.only(top: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Setup up details\nthis match',
                          style: Theme.of(context).textTheme.headline2,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: ListView(
                        children: [
                          CustomTextFormFieldWidget(
                            _controller.matchname,
                            "Match Name",
                            (s) {},
                            false,
                            false,
                            false,
                          ),
                          const SizedBox(height: 20),
                          Obx(() {
                            return CustomDropDown(
                              "Select Golf Course",
                              "Select Golf Course",
                              true,
                              List.generate(
                                  _controller.lstCourses.length,
                                  (index) => _controller
                                      .lstCourses[index].courseName
                                      .toString()),
                            );
                          }),
                          const SizedBox(height: 20),
                          Obx(() {
                            Future.delayed(Duration.zero, () async {
                              context
                                  .read<LoadingProvider>()
                                  .setLoad(_controller.isProcessing.value);
                            });
                            return CustomDropDownMultiSelect(
                              "Select players",
                              "List of players",
                              true,
                              true,
                              List.generate(
                                  _controller.lstPlayers.length,
                                  (index) => _controller.lstPlayers[index].fname
                                      .toString()),
                            );
                          }),
                          const SizedBox(height: 20),
                          ListNumberDropdown(
                            name: 'Hole',
                            label: 'Hole Number',
                            hint: 'Select number of holes',
                            listItems: _controller.holes,
                            callback: (value) {
                              _controller.numberOfHolesToPlay.value =
                                  value as int;
                              print('HOLES ----------> ${_controller.holes}');
                              print(
                                  'NUMBER HOLES SELECTED -----------> $value');
                            },
                          ),
                          const SizedBox(height: 20),
                          ListNumberDropdown(
                            name: 'Starting Hole',
                            label: 'Tee off point',
                            hint: 'Select starting hole',
                            listItems: _controller.startHoleOptions,
                            callback: (value) {
                              _controller.startingHole.value = value!;
                              print(
                                  'HOLE OPTIONS -----------> ${_controller.startHoleOptions}');
                              print(
                                  'STARTING HOLE SELECTED ----------> $value');
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CustomDatePicker(
                            label: 'Pick match date',
                            name: 'Match Date',
                            callback: (newSelectedDate) {
                              _controller.selectedDate.value = newSelectedDate!;
                              print(newSelectedDate);
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CustomTimePicker(
                            label: 'Pick match Time',
                            name: 'Match Time',
                            callback: (newSelectedDate) {
                              String formattedTime =
                                  DateFormat('kk:mm').format(newSelectedDate!);
                              _controller.selectedTime.value =
                                  formattedTime.toString();
                              print(formattedTime);
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Align(
                            alignment: FractionalOffset.bottomCenter,
                            child: Obx(
                              () {
                                //Dismissing the keyboard
                                return CustomButton(
                                  textStyle: GcmsTheme.lightTextTheme.bodyText2,
                                  text: _controller.isProcessing.value == true
                                      ? 'Processing'
                                      : 'Confirm',
                                  onPressed: () {
                                    var comp = CompetitionRequest(
                                      compName: _controller.matchname.text,
                                      gametypeId: 1,
                                      compFee: 0.0,
                                      compDate: _controller.selectedDate.value
                                          .toString(),
                                      time: _controller.selectedTime.value,
                                      gameHoles:
                                          _controller.numberOfHolesToPlay.value,
                                      startingHole:
                                          _controller.startingHole.value,
                                      courseId: int.parse(
                                          _controller.selectedCourseId.value),
                                      playerIds: _controller.selectedPlayers
                                          .cast<int>(),
                                    );
                                    _controller
                                        .createCompetition(comp.toJson());
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
      );
    });
  }
}
