import 'package:flutter/material.dart';
import 'package:gcms/app/modules/commonWidgets/snackbar.dart';
import 'package:gcms/app/modules/matchInvitesScreen/providers/match_invites_provider.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../match_invites_model.dart';

class MatchInvitesController extends GetxController {
  //TODO: Implement JoinMatchScreenController
  var isProcessing = false.obs;
  var matchInvites = <MatchInvites>[].obs;
  var storage = GetStorage();

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void increment() => count.value++;

  getMatchInvites() {
    // print("DATA FOR RECEIVING INVITES---------> $data");
    try {
      isProcessing(true);
      MatchInvitesProvider().getMatchInvites(storage.read('userId')).then(
          (resp) async {
        List<MatchInvites> data = resp;
        matchInvites.addAll(resp);
        // change(data, status: RxStatus.success());
        print("INVITE SUCCESSFULLY RECEIVED  ---> $resp");
        isProcessing(false);
      }, onError: (err) {
        // change(null, status: RxStatus.error(err.toString()));
        print("Error receiving invites -->" + err.toString());
        ShowSnackBar("Error", err.toString(), Colors.red);
        isProcessing(false);
      });
    } catch (exception) {
      print("Exception receiving invites  -->" + exception.toString());
      ShowSnackBar("Exception", exception.toString(), Colors.red);
      isProcessing(false);
    }
  }
}
