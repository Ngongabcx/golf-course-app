import 'package:flutter/material.dart';
import 'package:gcms/app/components/submit_button.dart';
import 'package:gcms/theme/gcms_theme.dart';
import 'package:get/get.dart';

import '../controllers/results_screen_controller.dart';

class ResultsScreenView extends GetView<ResultsScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        automaticallyImplyLeading: true,
        title: Align(
          alignment: const AlignmentDirectional(-1, 0),
          child: Text(
            'Match Results',
            style: Theme.of(context).textTheme.headline3,
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.height,
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 16.0, top: 16.0),
                      child: Text(
                        'Course',
                        style: GcmsTheme.lightTextTheme.headline3,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {}, // Handle your callback.
                            child: Ink(
                              height: 100,
                              width: 80,
                              decoration: BoxDecoration(
                                // shape: ,
                                image: const DecorationImage(
                                  image: AssetImage(
                                      'assets/images/lusaka_golf_club_picture.jpg'),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 16.0),
                            child: Text(
                              'Chinama Hills Golf Course',
                              style: GcmsTheme.lightTextTheme.headline3,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 16.0, top: 16.0),
                            child: Text(
                              'Lusaka, Zambia',
                              style: GcmsTheme.lightTextTheme.bodyText2,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 16.0),
                      child: Text(
                        'Players',
                        style: GcmsTheme.lightTextTheme.headline3,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16.0),
                      child: Text(
                        'Scores',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ),
                  ],
                ),
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
                    Expanded(
                      flex: 2,
                      child: Text(
                        controller.res,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50.0,
                  width: 500.0,
                  child: Divider(
                    color: Color(0xFFF6F6F6),
                    thickness: 3.0,
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: SubmitButton(
                          text: ('Confirm Result'),
                          style: GcmsTheme.lightTextTheme.bodyText2,
                          onPressed: () async {
                            // final scoreCard = await _service.addScorecard(
                            //   scorecard: Scorecard(id: 1, score: 3, result: 4),
                            // );
                            Get.toNamed("/scores-input-screen");
                          }),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
