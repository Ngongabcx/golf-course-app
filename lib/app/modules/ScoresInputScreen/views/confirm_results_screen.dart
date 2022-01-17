import 'package:flutter/material.dart';
import 'package:gcms/app/modules/ScoresInputScreen/controllers/scores_input_screen_controller.dart';
import 'package:gcms/constants/constant.dart';
import 'package:get/get.dart';

class ConfirmResultsScreenView extends GetView<ScoresInputScreenController> {
  final _controller = Get.put(ScoresInputScreenController());
  @override
  Widget build(BuildContext context) {
    return _controller.isProcessing.value == true
        ? Center(child: CircularProgressIndicator())
        : Scaffold(
            appBar: AppBar(
              title: Text('Confirm Results'),
              centerTitle: true,
            ),
            body: Center(
              child: Column(
                children: [
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 16.0, top: 16.0),
                        child: Expanded(
                          flex: 5,
                          child: CircleAvatar(
                            radius: 30.0,
                            backgroundImage:
                                AssetImage('assets/images/Tiger-Woods.jpg'),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 10,
                        child: Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Text(
                            'Tiger Woods (You)',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 450.0,
                    width: 500.0,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(60, 12, 0, 0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 50,
                          ),
                          Table(
                            children: [
                              TableRow(
                                children: [
                                  const Text(
                                    'Score',
                                    style: TextStyle(
                                      color: kPrimaryColor,
                                    ),
                                  ),
                                  Text(
                                    '12',
                                    style: TextStyle(
                                      color: kPrimaryColor,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  const Text(
                                    'Hole ',
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    '1',
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  const Text(
                                    'Date',
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    '03/12/22',
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  const Text(
                                    'Time',
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    '01:15 PM',
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.blue),
                              textStyle: MaterialStateProperty.all(
                                const TextStyle(color: Colors.white),
                              ),
                              minimumSize: MaterialStateProperty.all(
                                Size(MediaQuery.of(context).size.width / 2.5,
                                    50),
                              ),
                            ),
                            child: const Text(
                              'Decline',
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              await _controller.updateScorecard(
                                  {"confirmed": true}, "scorecardId");
                              Get.back();
                            },
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.teal),
                              textStyle: MaterialStateProperty.all(
                                const TextStyle(color: Colors.white),
                              ),
                              minimumSize: MaterialStateProperty.all(
                                Size(MediaQuery.of(context).size.width / 2.5,
                                    50),
                              ),
                            ),
                            child: const Text(
                              'Accept',
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
  }
}
