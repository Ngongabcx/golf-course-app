import 'package:flutter/material.dart';
import 'package:gcms/app/modules/SettingScreen/views/setting_screen_view.dart';
import 'package:gcms/app/modules/SetupScreen/competition_request_model.dart';
import 'package:gcms/app/modules/SetupScreen/controllers/setup_screen_controller.dart';
import 'package:gcms/app/modules/commonWidgets/CustomTimePicker.dart';
import 'package:gcms/app/modules/commonWidgets/build_form_builder_dropdown.dart';
import 'package:gcms/app/modules/commonWidgets/customButton.dart';
import 'package:gcms/app/modules/commonWidgets/custom_appbar.dart';
import 'package:gcms/app/modules/commonWidgets/custom_date_time_picker.dart.dart';
import 'package:gcms/app/modules/commonWidgets/custom_multi_select_drop_down.dart';
import 'package:gcms/app/modules/commonWidgets/custom_single_select_drop_down.dart';
import 'package:gcms/app/modules/commonWidgets/loader/loader.dart';
import 'package:gcms/app/modules/commonWidgets/loader/loading_provider.dart';
import 'package:gcms/app/modules/commonWidgets/textFormField.dart';
import 'package:gcms/constants/constant.dart';
import 'package:gcms/theme/gcms_theme.dart';
import 'package:get/get.dart';
import 'package:provider/src/provider.dart';

class MatchSetupView extends GetView<SetupScreenController> {
  final controller = Get.put(SetupScreenController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: kBackgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBar(
                Icons.arrow_back_ios_outlined,
                Icons.settings_outlined,
                leftCallBack: () => Get.back(),
                rightCallBack: () => Get.to(SettingScreenView()),
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Text(
                            'Setup up your Match',
                            style: Theme.of(context).textTheme.headline2,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                    margin: EdgeInsets.only(top: 10),
                    child: controller.isProcessing.value == true
                        ? Loader()
                        : Column(
                            children: [
                              CustomTextFormFieldWidget(
                                controller.matchname,
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
                                      controller.lstCourses.length,
                                      (index) => controller
                                          .lstCourses[index].courseName
                                          .toString()),
                                );
                              }),
                              const SizedBox(height: 20),
                              Obx(() {
                                Future.delayed(Duration.zero, () async {
                                  context
                                      .read<LoadingProvider>()
                                      .setLoad(controller.isProcessing.value);
                                });
                                return CustomDropDownMultiSelect(
                                  "Select players",
                                  "List of players",
                                  true,
                                  true,
                                  List.generate(
                                      controller.lstPlayers.length,
                                      (index) => controller
                                          .lstPlayers[index].fname
                                          .toString()),
                                );
                              }),
                              const SizedBox(height: 20),
                              BuildFormBuilderDropdown(
                                name: 'Hole',
                                label: '',
                                hint: 'Select number of holes',
                                listItems: controller.holes,
                                callback: (value) {
                                  controller.currentSelectedHole.value = value;
                                },
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              CustomDatePicker(
                                label: 'Pick match date',
                                name: 'Match Date',
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              CustomTimePicker(
                                label: 'Pick match Time',
                                name: 'Match Time',
                              ),
                              const SizedBox(height: 30),
                              Align(
                                alignment: FractionalOffset.bottomCenter,
                                child: Obx(
                                  () {
                                    //Dismissing the keyboard
                                    return CustomButton(
                                      textStyle:
                                          GcmsTheme.lightTextTheme.bodyText2,
                                      text:
                                          controller.isProcessing.value == true
                                              ? 'Processing'
                                              : 'Confirm',
                                      onPressed: () {
                                        var comp = CompetitionRequest(
                                          compName: controller.matchname.text,
                                          gametypeId: 1,
                                          compFee: 0.0,
                                          compDate: controller.matchDate.value,
                                          compTime: controller.matchTime.value,
                                          gameHoles: controller
                                              .numberOfHolesToPlay.value
                                              .toString(),
                                          startingHole:
                                              controller.startingHole.value,
                                          courseId: int.parse(controller
                                              .selectedCourseId.value),
                                          competitionPlayer: controller
                                              .selectedPlayers
                                              .cast<int>(),
                                        );
                                        controller
                                            .createCompetition(comp.toJson());
                                      },
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                  ),
                ],
                margin: EdgeInsets.only(top: 40),
                child: controller.isProcessing.value == true
                    ? Loader()
                    : Column(
                        children: [
                          CustomTextFormFieldWidget(
                            controller.matchname,
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
                                  controller.lstCourses.length,
                                  (index) => controller
                                      .lstCourses[index].courseName
                                      .toString()),
                            );
                          }),
                          const SizedBox(height: 20),
                          Obx(() {
                            Future.delayed(Duration.zero, () async {
                              context
                                  .read<LoadingProvider>()
                                  .setLoad(controller.isProcessing.value);
                            });
                            return CustomDropDownMultiSelect(
                              "Select players",
                              "List of players",
                              true,
                              true,
                              List.generate(
                                  controller.lstPlayers.length,
                                  (index) => controller.lstPlayers[index].fname
                                      .toString()),
                            );
                          }),
                          const SizedBox(height: 20),
                          BuildFormBuilderDropdown(
                            name: 'Hole',
                            label: '',
                            hint: 'Select number of holes',
                            listItems: controller.holes,
                            callback: (value) {
                              controller.numberOfHolesToPlay.value = value;
                            },
                          ),
                          const SizedBox(height: 20),
                          BuildFormBuilderDropdown(
                            name: 'Starting Hole',
                            label: '',
                            hint: 'Select starting hole',
                            listItems: controller.startHoleOptions,
                            callback: (value) {
                              controller.startingHole.value = value;
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CustomDatePicker(
                            label: 'Pick match date',
                            name: 'Match Date',
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CustomTimePicker(
                            label: 'Pick match Time',
                            name: 'Match Time',
                          ),
                          const SizedBox(height: 30),
                          Align(
                            alignment: FractionalOffset.bottomCenter,
                            child: Obx(
                              () {
                                //Dismissing the keyboard
                                return CustomButton(
                                  textStyle: GcmsTheme.lightTextTheme.bodyText2,
                                  text: controller.isProcessing.value == true
                                      ? 'Processing'
                                      : 'Confirm',
                                  onPressed: () {
                                    var comp = CompetitionRequest(
                                      compName: controller.matchname.text,
                                      gametypeId: 1,
                                      compFee: 0.0,
                                      compDate: controller.matchDate.value,
                                      compTime: controller.matchTime.value,
                                      gameHoles: controller
                                          .numberOfHolesToPlay.value
                                          .toString(),
                                      startingHole:
                                          controller.startingHole.value,
                                      courseId: int.parse(
                                          controller.selectedCourseId.value),
                                      competitionPlayer: controller
                                          .selectedPlayers
                                          .cast<int>(),
                                    );
                                    controller.createCompetition(comp.toJson());
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
