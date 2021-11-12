import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gcms/app/components/circle_image.dart';
import 'package:gcms/app/components/round_button_widget.dart';
import 'package:gcms/app/components/submit_button.dart';
import 'package:gcms/app/modules/ActiveGameScreen/views/update_score_button.dart';
import 'package:gcms/app/modules/ScoresInputScreen/views/result_widget.dart';
import 'package:gcms/app/modules/ScoresInputScreen/views/score_widget.dart';
import 'package:gcms/theme/gcms_theme.dart';

import 'package:get/get.dart';

import '../controllers/scores_input_screen_controller.dart';

class ScoresInputScreenView extends GetView<ScoresInputScreenController> {
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
            'Score Input',
            style: Theme.of(context).textTheme.headline3,
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 1,
      ),
      body: Obx(
        () {
          return SingleChildScrollView(
            child: SafeArea(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.height,
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 16.0),
                          child: CircleImage(
                            imageProvider:
                                AssetImage('assets/images/Tiger-Woods.jpg'),
                          ),
                        ),
                        Text(
                          'Tiger Woods',
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        Text(
                          'hcp ${controller.hcp.value.toString()}',
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25.0,
                      width: 500.0,
                      child: Divider(
                        color: Color(0xFFF6F6F6),
                        thickness: 3.0,
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              RoundButtonWidget(
                                text: controller.hole.value.toString(),
                                style: Theme.of(context).textTheme.bodyText2,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  'Hole',
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              RoundButtonWidget(
                                text: controller.par.value.toString(),
                                style: Theme.of(context).textTheme.bodyText2,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  'Par',
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              RoundButtonWidget(
                                text: controller.stroke.value.toString(),
                                style: Theme.of(context).textTheme.bodyText2,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  'Stroke',
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25.0,
                      width: 500.0,
                      child: Divider(
                        color: Color(0xFFF6F6F6),
                        thickness: 3.0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 0.0, right: 16.0, bottom: 8.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Score',
                                  style: Theme.of(context).textTheme.headline3,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                UpdateScoreButtton(
                                  icon: Icons.remove,
                                  onPressed: () {
                                    controller.score--;
                                    print(controller.score.value);
                                    controller.calculateResult();
                                  },
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                ScoreWidget(
                                  text: controller.score.value.toString(),
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                UpdateScoreButtton(
                                  icon: Icons.add,
                                  onPressed: () {
                                    controller.score++;
                                    controller.calculateResult();
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 8.0, right: 16.0, bottom: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            flex: 4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Result',
                                  style: Theme.of(context).textTheme.headline2,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Column(
                              children: [
                                ResultWidget(
                                  text: controller.result.value.toString(),
                                  style: GcmsTheme.darkTextTheme.bodyText1,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 45.0,
                      width: 500.0,
                      child: Divider(
                        color: Color(0xFFF6F6F6),
                        thickness: 3.0,
                      ),
                    ),
                    Column(
                      children: [
                        SubmitButton(
                          text: 'Submit Your Score',
                          onPressed: () {
                            controller.calculateResult();
                            Get.toNamed("/results-screen");
                          },

                          // onPressed: () async {
                          //   print(score);
                          //   final result = await HttpService().addScore(
                          //     Scorecard(
                          //       1,
                          //       _result,
                          //     ),
                          //   );
                          //   print(result);
                          // },
                          style: GcmsTheme.lightTextTheme.bodyText2,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
