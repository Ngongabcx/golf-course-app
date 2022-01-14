import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:gcms/app/modules/ActiveGameScreen/views/select_holes_card.dart';
import 'package:gcms/app/modules/commonWidgets/customButton.dart';
import 'package:gcms/app/modules/commonWidgets/custom_multi_select_drop_down.dart';
import 'package:gcms/app/modules/commonWidgets/custom_single_select_drop_down.dart';
import 'package:gcms/app/modules/commonWidgets/loader/loader.dart';
import 'package:gcms/app/modules/commonWidgets/loader/loading_provider.dart';
import 'package:gcms/app/modules/commonWidgets/textFormField.dart';
import 'package:gcms/constants/constant.dart';
import 'package:gcms/theme/gcms_theme.dart';
import 'package:get/get.dart';
import 'package:provider/src/provider.dart';

import '../competition_request_model.dart';
import '../controllers/setup_screen_controller.dart';

class SetupScreenView extends GetView<SetupScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        automaticallyImplyLeading: true,
        title: Text(
          ' Match Setup',
          style: Theme.of(context).textTheme.headline3,
        ),
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      body: Obx(
        () {
          return SafeArea(
            child: controller.isProcessing.value == true
                ? Loader()
                : Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.height,
                    padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 20.0),
                    child: ListView(
                      children: [
                        CustomTextFormFieldWidget(
                          controller.matchname,
                          "Match Name",
                          (s) {},
                          false,
                          false,
                          false,
                        ),
                        // TextFormField(
                        //   controller: controller.matchName,
                        //   decoration: InputDecoration(
                        //       fillColor: Colors.white,
                        //       focusedBorder: OutlineInputBorder(
                        //         borderRadius: BorderRadius.circular(5.0),
                        //         borderSide: const BorderSide(
                        //           color: Color(0xFF22C17B),
                        //         ),
                        //       ),
                        //       enabledBorder: OutlineInputBorder(
                        //         borderRadius: BorderRadius.circular(5.0),
                        //         borderSide: const BorderSide(
                        //           color: Color(0xFF9C9D9E),
                        //         ),
                        //       ),
                        //       labelText: 'Match Name',
                        //       labelStyle:
                        //           Theme.of(context).textTheme.headline3),
                        // ),
                        const SizedBox(height: 20),
                        Text(
                          'Select Golf Course',
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        const SizedBox(height: 20),
                        Obx(() {
                          return CustomDropDown(
                            "Golf Course",
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
                        Text(
                          'Player Setup',
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        const SizedBox(height: 16),
                        Obx(() {
                          Future.delayed(Duration.zero, () async {
                            context
                                .read<LoadingProvider>()
                                .setLoad(controller.isProcessing.value);
                          });
                          return CustomDropDownMultiSelect(
                            "Invite Players",
                            "Player in menu mode",
                            true,
                            true,
                            List.generate(
                                controller.lstPlayers.length,
                                (index) => controller.lstPlayers[index].fname
                                    .toString()),
                          );
                        }),
                        const SizedBox(height: 20),
                        Text('Select Number Of Holes To Play',
                            style: Theme.of(context).textTheme.headline3),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Obx(() {
                              return SelectHolesCard(
                                onPress: () {
                                  controller.startingHole.value.isBlank;
                                  controller.endingHoleOptions.clear();
                                  controller.numberOfHolesToPlay.value = 9;
                                  controller.startingHoleOptions.clear();
                                  controller.startingHoleOptions
                                      .addAll(controller.hole9options);
                                  controller.endingHoleOptions
                                      .addAll(controller.startingHoleOptions);
                                  print(
                                      "Number of holes to play ==> ${controller.numberOfHolesToPlay.value}");
                                  print(
                                      "STARTING HOLE OPTIONS ==> ${controller.startingHoleOptions}");
                                },
                                color: controller.numberOfHolesToPlay.value == 9
                                    ? kActiveCardColor
                                    : kInactiveCardColor,
                                cardChild: Padding(
                                  padding: EdgeInsets.only(top: 10.0),
                                  child: Text(
                                    'Nine',
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              );
                            }),
                            Obx(() {
                              return SelectHolesCard(
                                onPress: () {
                                  controller.startingHole.value.isBlank;
                                  controller.endingHoleOptions.clear();
                                  controller.numberOfHolesToPlay.value = 18;
                                  controller.startingHoleOptions.clear();
                                  controller.startingHoleOptions
                                      .addAll(controller.hole18options);
                                  controller.endingHoleOptions
                                      .addAll(controller.startingHoleOptions);
                                  print(
                                      "Number of holes to play ==> ${controller.numberOfHolesToPlay.value}");
                                  print(
                                      "STARTING HOLE OPTIONS ==> ${controller.startingHoleOptions}");
                                },
                                color:
                                    controller.numberOfHolesToPlay.value == 18
                                        ? kActiveCardColor
                                        : kInactiveCardColor,
                                cardChild: Padding(
                                  padding: EdgeInsets.only(top: 10.0),
                                  child: Text(
                                    'Eighteen',
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              );
                            }),
                          ],
                        ),
                        // const SizedBox(height: 20),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     Obx(() {
                        //       return DropdownButton<int>(
                        //         hint: Text(
                        //           'Front nine',
                        //           style: Theme.of(context).textTheme.bodyText2,
                        //         ),
                        //         items: controller.startingHoleOptions
                        //             .map((int value) {
                        //           return DropdownMenuItem<int>(
                        //             value: value,
                        //             child: Text(value.toString()),
                        //           );
                        //         }).toList(),
                        //         onChanged: (int? val) {
                        //           if (controller.startingHole.value != 0) {
                        //             controller.endingHoleOptions
                        //                 .add(controller.startingHole.value);
                        //           }
                        //           controller.startingHole.value = val!.toInt();
                        //           if (controller.numberOfHolesToPlay.value ==
                        //               9) {
                        //             controller.endingHoleOptions.clear();
                        //             if (val == 1) {
                        //               controller.endingHoleOptions.add(9);
                        //               controller.endingHole.value = 9;
                        //             } else if (val == 9) {
                        //               controller.endingHoleOptions.add(1);
                        //               controller.endingHole.value = 1;
                        //             } else if (val == 10) {
                        //               controller.endingHoleOptions.add(18);
                        //               controller.endingHole.value = 18;
                        //             } else if (val == 18) {
                        //               controller.endingHoleOptions.add(10);
                        //               controller.endingHole.value = 10;
                        //             }
                        //           } else {
                        //             controller.endingHoleOptions
                        //                 .removeWhere((item) => item == val);
                        //           }
                        //           print(
                        //               "Starting to play from ==> ${controller.startingHole.value}");
                        //           print(
                        //               "Ending at options ==> ${controller.endingHoleOptions}");
                        //         },
                        //       );
                        //     }),
                        //     Obx(() {
                        //       return DropdownButton<int>(
                        //         hint: Text(
                        //           'Back nine',
                        //           style: Theme.of(context).textTheme.bodyText2,
                        //         ),
                        //         items: controller.endingHoleOptions
                        //             .map((int value) {
                        //           return DropdownMenuItem<int>(
                        //             value: value,
                        //             child: Text(value.toString()),
                        //           );
                        //         }).toList(),
                        //         onChanged: (int? val) {
                        //           controller.endingHole.value = val!.toInt();
                        //           print(
                        //               "Ending to play at ==> ${controller.endingHole.value}");
                        //         },
                        //       );
                        //     }),
                        //   ],
                        // ),
                        const SizedBox(height: 20),
                        Container(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                      side: BorderSide(
                                        color: Color(0xFFDBE2E7),
                                        width: 2.0,
                                      ),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  DatePicker.showDatePicker(context,
                                      theme: const DatePickerTheme(
                                        containerHeight: 210.0,
                                      ),
                                      showTitleActions: true,
                                      minTime: DateTime(2000, 1, 1),
                                      maxTime: DateTime(2022, 12, 31),
                                      onConfirm: (date) {
                                    print('confirm $date');
                                    controller.matchDate.value =
                                        '${date.year}-${date.month}-${date.day}';
                                  },
                                      currentTime: DateTime.now(),
                                      locale: LocaleType.en);
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 50.0,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                                Obx(() => Text(
                                                      " ${controller.matchDate.value}",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText2,
                                                    )),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      Text(
                                        "  Change",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                      side: BorderSide(
                                        color: Color(0xFFDBE2E7),
                                        width: 2.0,
                                      ),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  DatePicker.showTimePicker(context,
                                      theme: const DatePickerTheme(
                                        containerHeight: 210.0,
                                      ),
                                      showTitleActions: true,
                                      onConfirm: (time) {
                                    controller.matchTime.value =
                                        '${time.hour}:${time.minute}:${time.second}';
                                  },
                                      currentTime: DateTime.now(),
                                      locale: LocaleType.en);
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 50.0,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                                Obx(() {
                                                  return Text(
                                                      "${controller.matchTime.value}",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText2);
                                                }),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      Text(
                                        "  Change",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2,
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 50),
                        Expanded(
                          child: Align(
                            alignment: FractionalOffset.bottomCenter,
                            child: Obx(() {
                              //Dismissing the keyboard
                              FocusScope.of(context)
                                  .requestFocus(new FocusNode());
                              return CustomButton(
                                textStyle: GcmsTheme.lightTextTheme.bodyText2,
                                text: controller.isProcessing.value == true
                                    ? 'Processing'
                                    : 'Confirm',
                                onPressed: () {
                                  var comp = CompetitionRequest(
                                    //compName: controller.matchName.text,
                                    compName: "Test ${DateTime.now()}",
                                    gametypeId: 1,
                                    compFee: 0.0,
                                    compDate: controller.matchDate.value,
                                    compTime: controller.matchTime.value,
                                    gameHoles: controller
                                        .numberOfHolesToPlay.value
                                        .toString(),
                                    startingHole: 1,
                                    courseId: int.parse(
                                        controller.selectedCourseId.value),
                                    competitionPlayer:
                                        controller.selectedPlayers.cast<int>(),
                                  );
                                  controller.createCompetition(comp.toJson());
                                },
                              );
                            }),
                          ),
                        ),
                      ],
                    ),
                  ),
          );
        },
      ),
    );
  }
}
