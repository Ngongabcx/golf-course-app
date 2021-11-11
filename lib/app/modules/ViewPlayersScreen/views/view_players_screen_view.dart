import 'package:flutter/material.dart';
import 'package:gcms/app/components/submit_button.dart';
import 'package:gcms/theme/gcms_theme.dart';

import 'package:get/get.dart';

import '../controllers/view_players_screen_controller.dart';

class ViewPlayersScreenView extends GetView<ViewPlayersScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        automaticallyImplyLeading: true,
        title: const Align(
          alignment: AlignmentDirectional(-1, 0),
          child: Text(
            'Players view page',
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
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
                        style: GcmsTheme.lightTextTheme.headline2,
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
                                      'images/lusaka_golf_club_picture.jpg'),
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
                              style: GcmsTheme.lightTextTheme.bodyText2,
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
                        style: GcmsTheme.lightTextTheme.bodyText2,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16.0),
                      child: Text(
                        'Options',
                        style: GcmsTheme.lightTextTheme.bodyText2,
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
                          backgroundImage: AssetImage('images/Tiger-Woods.jpg'),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 10,
                      child: Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Text(
                          'Tiger Woods (You)',
                          style: GcmsTheme.lightTextTheme.bodyText2,
                        ),
                      ),
                    ),
                    const Expanded(
                      flex: 2,
                      child: Icon(Icons.more_vert),
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
                          text: ('Proceed to hole'),
                          style: GcmsTheme.lightTextTheme.bodyText2,
                          onPressed: () {
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
