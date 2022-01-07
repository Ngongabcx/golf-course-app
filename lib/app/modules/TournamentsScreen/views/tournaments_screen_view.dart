import 'package:flutter/material.dart';
import 'package:gcms/app/modules/ActiveGameScreen/views/search_card.dart';
import 'package:gcms/app/modules/SettingScreen/views/setting_screen_view.dart';
import 'package:gcms/app/modules/TournamentsScreen/views/widgets/tournament_list_view.dart';
import 'package:gcms/app/modules/commonWidgets/custom_appbar.dart';
import 'package:gcms/constants/constant.dart';
import 'package:get/get.dart';

import '../controllers/tournaments_screen_controller.dart';

class TournamentsScreenView extends GetView<TournamentsScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              CustomAppBar(
                Icons.arrow_back_ios_outlined,
                Icons.settings_outlined,
                leftCallBack: () => Get.back(),
                rightCallBack: () => Get.to(SettingScreenView()),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SearchCard(),
              ),
              Expanded(
                child: Center(
                  child: Expanded(
                    child: TournamentListView(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
