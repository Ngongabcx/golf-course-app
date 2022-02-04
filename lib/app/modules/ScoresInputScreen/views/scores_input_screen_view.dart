import 'package:flutter/material.dart';
import 'package:gcms/app/components/circle_image.dart';
import 'package:gcms/app/components/round_button_widget.dart';
import 'package:gcms/app/modules/ActiveGameScreen/views/update_score_button.dart';
import 'package:gcms/app/modules/ScoresInputScreen/views/result_widget.dart';
import 'package:gcms/app/modules/ScoresInputScreen/views/score_widget.dart';
import 'package:gcms/app/modules/SetupScreen/competition_model.dart';
import 'package:gcms/app/modules/commonWidgets/customButton.dart';
import 'package:gcms/app/modules/commonWidgets/loader/loader.dart';
import 'package:gcms/constants/constant.dart';
import 'package:gcms/theme/gcms_theme.dart';
import 'package:get/get.dart';

import '../controllers/scores_input_screen_controller.dart';

class ScoresInputScreenView extends GetView<ScoresInputScreenController> {
  final _controller = Get.put(ScoresInputScreenController());
  final Payload competition;

  final CompetitionPlayer? competitionPlayer;
  ScoresInputScreenView(this.competition, this.competitionPlayer);
  @override
  Widget build(BuildContext context) {
    _controller.extractGameHolesArray(competition);
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Obx(
        () {
          return SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        PopupMenuButton<int>(
                          onSelected: (item) => onSelected(context, item),
                          itemBuilder: (context) => [
                            PopupMenuItem(
                              value: 0,
                              child: Text('Results'),
                              onTap: () {
                                Get.bottomSheet(
                                  ResultsBottomSheet(
                                    recordingFor: competitionPlayer!.recordingScoresFor,
                                    controller: _controller,
                                    competition: competition,
                                  ),
                                  elevation: 20.0,
                                  enableDrag: false,
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30.0),
                                      topRight: Radius.circular(30.0),
                                    ),
                                  ),
                                );
                              },
                            ),
                            PopupMenuItem(
                              value: 1,
                              child: Text('End Match'),
                              onTap: () {
                                Get.defaultDialog(
                                    confirmTextColor: Colors.white,
                                    title: "End Match",
                                    content: Text(
                                        "You will lose all your scores and match progress. This action cannot be reversed. Confirm ending match?"),
                                    onConfirm: () {
                                      Get.toNamed("/home");
                                    },
                                    onCancel: () {});
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.height,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25.0, vertical: 25.0),
                    child: _controller.isProcessing.value == true
                        ? Center(child: Loader())
                        : Column(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 0.0),
                                    child: CircleImage(
                                      imageProvider: NetworkImage(
                                          '${competitionPlayer!.recordingScoresFor!.imageThumbnail}'),
                                    ),
                                  ),
                                  Text(
                                    '${competitionPlayer!.recordingScoresFor!.fname} ${competitionPlayer!.recordingScoresFor!.lname}',
                                    style:
                                        Theme.of(context).textTheme.headline2,
                                  ),
                                  Text(
                                    'hcp ${competitionPlayer!.recordingScoresFor!.hcp}',
                                    style:
                                        Theme.of(context).textTheme.bodyText2,
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
                                        Obx(() {
                                          return RoundButtonWidget(
                                            text: _controller
                                                .gameHoles[
                                                    _controller.holeIndex.value]
                                                .holeNo
                                                .toString(),
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .bodyText2,
                                          );
                                        }),
                                        Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: Text(
                                            'Hole',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText2,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Column(
                                      children: [
                                        Obx(() {
                                          return RoundButtonWidget(
                                            text: _controller
                                                .gameHoles[
                                                    _controller.holeIndex.value]
                                                .par
                                                .toString(),
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .bodyText2,
                                          );
                                        }),
                                        Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: Text(
                                            'Par',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText2,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Column(
                                      children: [
                                        Obx(() {
                                          return RoundButtonWidget(
                                            text: _controller
                                                .gameHoles[
                                                    _controller.holeIndex.value]
                                                .stroke
                                                .toString(),
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .bodyText2,
                                          );
                                        }),
                                        Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: Text(
                                            'Stroke',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText2,
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
                                  color: kPrimaryColor,
                                  thickness: 0.3,
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Score',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1,
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
                                              _controller.score--;
                                              print(_controller.score.value);
                                              _controller.calculateResult();
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
                                            text: _controller.score.value
                                                .toString(),
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .bodyText2,
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
                                              _controller.score.value++;
                                              _controller.calculateResult();
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Result',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Column(
                                        children: [
                                          ResultWidget(
                                            text: _controller.result.value
                                                .toString(),
                                            textStyle: GcmsTheme
                                                .darkTextTheme.bodyText1,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20.0),
                                    child: CustomButton(
                                      textStyle:
                                          GcmsTheme.lightTextTheme.bodyText2,
                                      text: "Submit",
                                      onPressed: () {
                                        _controller.calculateResult();
                                        Get.defaultDialog(
                                          title: "Confirm Submission",
                                          // middleText: "Submit score of ${controller.}",

                                          titleStyle: TextStyle(fontSize: 18),
                                          onConfirm: () {
                                            _controller.addScorecard({
                                              'score': _controller.score.value
                                                  .toString(),
                                              'result': _controller.result.value
                                                  .toString(),
                                              "confirmed": false,
                                              "holeId": _controller
                                                  .gameHoles[_controller
                                                      .holeIndex.value]
                                                  .id
                                                  .toString(),
                                            }, "${competition.id}",
                                                "${competitionPlayer!.id}");
                                            Get.back();
                                          },
                                          onCancel: () {},
                                          textConfirm:
                                              _controller.isProcessing.value ==
                                                      false
                                                  ? "Confirm"
                                                  : 'procesing',
                                          textCancel:
                                              _controller.isProcessing.value ==
                                                      false
                                                  ? "Cancel"
                                                  : 'procesing',
                                          cancelTextColor: Colors.black,
                                          confirmTextColor: Colors.white,
                                          buttonColor: Colors.green,
                                          content: Column(
                                            children: [
                                              Text(
                                                "Score: ${_controller.score.value}",
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                              Text(
                                                "Result: ${_controller.result.value}",
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                            ],
                                          ),
                                          middleTextStyle:
                                              TextStyle(color: Colors.white),
                                        );
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 6.0),
                                    child: InkWell(
                                      onTap: () {
                                        _controller.getAllPlayers(
                                            competition.id.toString());
                                        Get.bottomSheet(
                                          ResultsBottomSheet(
                                              competition: competition,
                                              recordingFor: competitionPlayer!.player,
                                              controller: _controller),
                                          elevation: 20.0,
                                          enableDrag: false,
                                          backgroundColor: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(30.0),
                                              topRight: Radius.circular(30.0),
                                            ),
                                          ),
                                        );
                                      },
                                      child: Ink(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 12,
                                          horizontal: 16,
                                        ),
                                        decoration: BoxDecoration(
                                          border: Border(
                                            top: BorderSide(
                                              color: Colors.grey,
                                            ),
                                            bottom: BorderSide(
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 4.0),
                                                  child: Text(
                                                    "View Match Results",
                                                    style: TextStyle(
                                                      color: kPrimaryColor,
                                                      // fontWeight: FontWeight.bold,
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: CustomButton(
                                      textStyle:
                                          GcmsTheme.lightTextTheme.bodyText2,
                                      text: "End Match",
                                      onPressed: () {
                                        Get.defaultDialog(
                                            title: "End Match",
                                            content: Text(
                                                "You will lose all your scores and match progress. This action cannot be reversed. Confirm ending match?"),
                                            onConfirm: () {
                                              Get.toNamed("/home");
                                            },
                                            onCancel: () {});
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ],
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

class ResultsBottomSheet extends StatelessWidget {
  const ResultsBottomSheet({
    Key? key,
    required this.recordingFor,
    required this.competition,
    required ScoresInputScreenController controller,
  })  : _controller = controller,
        super(key: key);

  final Player? recordingFor;
  final ScoresInputScreenController _controller;
  final Payload competition;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => _controller.isProcessing.value == true
          ? Center(child: CircularProgressIndicator())
          : Container(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Text(
                            'Player',
                            style: GcmsTheme.lightTextTheme.headline3,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 14.0),
                          child: Text(
                            'Scores',
                            style: Theme.of(context).textTheme.headline3,
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: RefreshIndicator(
                        onRefresh: _pullRefresh,
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 8.0),
                          height: 360.0,
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            itemCount: _controller.compPlayers.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Row(
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 16.0, top: 16.0),
                                    child: Expanded(
                                      flex: 5,
                                      child: CircleAvatar(
                                        radius: 30.0,
                                        backgroundImage: NetworkImage(
                                            "${_controller.compPlayers[index].player!.image}"),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 10,
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 20.0),
                                      child: Text(
                                        '${_controller.compPlayers[index].player!.fname} ${_controller.compPlayers[index].player!.lname}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      _controller.compPlayers[index].totalResult
                                          .toString(),
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  Future<void> _pullRefresh() async {
    await _controller.getAllPlayers(competition.id.toString());
  }
}

void onSelected(BuildContext context, int item) {
  switch (item) {
    case 0:
      print('Results clicked');
      break;

    case 1:
      print('End Match clicked');
      break;
  }
}
