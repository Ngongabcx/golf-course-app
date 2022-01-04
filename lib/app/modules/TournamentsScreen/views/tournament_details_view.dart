import 'package:flutter/material.dart';
import 'package:gcms/app/modules/TournamentsScreen/tournament_model.dart';
import 'package:gcms/constants/constant.dart';
import 'package:get/get.dart';

class TournamentDetailsView extends GetView {
  // final Payload tournament;
  final Tournament tournament;
  TournamentDetailsView({required this.tournament});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        automaticallyImplyLeading: true,
        title: Text(
          tournament.compName,
          style: Theme.of(context).textTheme.headline3,
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.height,
          padding: EdgeInsets.only(left: 20, bottom: 20),
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tournament.compName,
                  // tournament.compName!,
                  style: Theme.of(context).textTheme.headline5,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  tournament.course,
                  // tournament.course.toString(),
                ),
                SizedBox(
                  height: 50.0,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Icon(
                        Icons.access_time,
                        size: 30.0,
                        color: kPrimaryColor,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        tournament.compTime,
                        // tournament.compTime.toString(),
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Icon(
                        Icons.calendar_today_outlined,
                        size: 30.0,
                        color: kPrimaryColor,
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(
                        tournament.compDate,
                        // tournament.compDate.toString(),
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Icon(
                        Icons.location_on,
                        size: 30.0,
                        color: kPrimaryColor,
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Text(
                        tournament.course,
                        // tournament.course.toString(),
                      ),
                    ),
                  ],
                ),
                // Expanded(
                //     child: ListView.builder(
                //   scrollDirection: Axis.vertical,
                //   shrinkWrap: true,
                //   physics: ScrollPhysics(),
                //   itemCount: tournament.competitionPlayer!.length,
                //   itemBuilder: (context, index) {
                //     return Row(
                //       children: [
                //         Padding(
                //           padding: EdgeInsets.only(left: 16.0, top: 16.0),
                //           child: Expanded(
                //             flex: 5,
                //             child: tournament.competitionPlayer![index].player!
                //                         .image ==
                //                     ""
                //                 ? CircleAvatar(
                //                     radius: 30.0,
                //                     backgroundImage: AssetImage(
                //                         'assets/images/Tiger-Woods.jpg'),
                //                   )
                //                 : CircleAvatar(
                //                     radius: 30.0,
                //                     backgroundImage: NetworkImage(tournament
                //                         .competitionPlayer![index].player!.image
                //                         .toString()),
                //                   ),
                //           ),
                //         ),
                //         Expanded(
                //           flex: 10,
                //           child: Padding(
                //             padding: EdgeInsets.only(left: 20.0),
                //             child: Text(
                //               "${tournament.competitionPlayer![index].player!.firstname.toString().split('.').last.replaceAll('_', ' ').capitalizeFirst ?? ''}",
                //               style: GcmsTheme.lightTextTheme.bodyText1,
                //             ),
                //           ),
                //         ),
                //         Expanded(
                //           flex: 2,
                //           child: PopupMenuButton<int>(
                //             onSelected: (item) => onSelected(context, item),
                //             itemBuilder: (context) => [
                //               PopupMenuItem(
                //                 value: 0,
                //                 child: Text('Setup player'),
                //               ),
                //               PopupMenuItem(
                //                 value: 1,
                //                 child: Text('Remove'),
                //               ),
                //             ],
                //           ),
                //         ),
                //       ],
                //     );
                //   },
                // )),
                // const SizedBox(
                //   height: 50.0,
                //   width: 500.0,
                //   child: Divider(
                //     color: Color(0xFFF6F6F6),
                //     thickness: 3.0,
                //   ),
                // ),
                // Column(
                //   children: [
                //     Padding(
                //       padding: const EdgeInsets.only(bottom: 16.0),
                //       child: CustomButton(
                //         textStyle: GcmsTheme.lightTextTheme.bodyText2,
                //         text: "Play",
                //         onPressed: () {
                //           // Get.offAll(ScoresInputScreenView(tournament));
                //         },
                //       ),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// void onSelected(BuildContext context, int item) {
//   switch (item) {
//     case 0:
//       print('player setup clicked');
//       break;
//
//     case 1:
//       print('Remove clicked');
//       break;
//   }
// }
