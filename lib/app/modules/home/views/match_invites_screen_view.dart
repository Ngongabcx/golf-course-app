import 'package:flutter/material.dart';
import 'package:gcms/app/modules/ActiveGameScreen/views/competition_detail_view.dart';
import 'package:gcms/app/modules/SettingScreen/views/setting_screen_view.dart';
import 'package:gcms/app/modules/SetupScreen/competition_model.dart';
import 'package:gcms/app/modules/commonWidgets/loader/loader.dart';
import 'package:gcms/app/modules/commonWidgets/search_card.dart';
import 'package:gcms/app/modules/home/controllers/home_controller.dart';
import 'package:gcms/constants/constant.dart';
import 'package:get/get.dart';

import 'matchInvitationsCard.dart';

class MatchInvitesScreenView extends GetView<HomeController> {
  final _controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    var invitations = _controller.matchInvites.value.payload;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: kBackgroundColor,
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings_outlined,
            ),
            onPressed: () {
              // do something
              Get.to(SettingScreenView());
            },
          ),
        ],
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Container(
          child: _controller.isProcessing.value == true
              ? Loader()
              : Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Text(
                              'Your list of Match Invitations',
                              style: Theme.of(context).textTheme.headline2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20.0),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: SearchCard(),
                    ),
                    Expanded(
                      child: _controller.matchInvList == null
                          ? Center(
                              child: Text("No Invitations."),
                            )
                          : Expanded(
                              child: MatchInviteListView(
                                  controller: _controller,
                                  invitations: invitations),
                            ),
                      // ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

class MatchInviteListView extends StatelessWidget {
  const MatchInviteListView({
    Key? key,
    required HomeController controller,
    required this.invitations,
  })  : _controller = controller,
        super(key: key);

  final HomeController _controller;
  final List<Payload>? invitations;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      child: RefreshIndicator(
        onRefresh: _pullRefresh,
        child: ListView.builder(
          controller: _controller.scrollController,
          itemCount: _controller.matchInvList.length,
          itemBuilder: (BuildContext context, int index) {
            if (index == _controller.matchInvList.length - 1 &&
                _controller.isProcessing.value == true) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return GestureDetector(
              onTap: () {
                Get.to(
                  CompetitionDetailView(
                      competition: _controller.matchInvList[index]),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: MatchInvitationsCard(
                  invitations: _controller.matchInvList[index],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Future<void> _pullRefresh() async {
    await _controller.getMatchInvites(
        _controller.matchInvList.first.id.toString(), _controller.page);
  }
}
