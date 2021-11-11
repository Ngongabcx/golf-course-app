import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';

class CommandProvider extends GetConnect {
  // Fetch Data
  Future<List<dynamic>> getCommands() async {
    try {
      final response =
          await get("https://commander.onthewifi.com/api/commands");
      if (response.status.hasError) {
        log('<<===FAILED TO GET COMMANDS ==> ' + response.statusText);
        return Future.error(response.statusText);
      } else {
        return response.body;
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

  //Save Data
  Future<String> saveCommand(Map data) async {
    try {
      final response =
          await post("https://commander.onthewifi.com/api/commands", data);
      if (response.status.hasError) {
        log('<<===FAILED TO SAVE COMMAND ==> ' + response.statusText);
        return Future.error(response.statusText);
      } else {
        log('<<RESPONSE BODY-----> ' + response.body.toString());
        return response.body.toString();
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

  // Update Data
  Future<String> updateCommand(Map data) async {
    log('Update called');
    try {
      final response =
          await patch("https://commander.onthewifi.com/api/commands", data);
      if (response.status.hasError) {
        log('<<===FAILED TO UPDATE COMMAND ==> ' + response.statusText);
        return Future.error(response.statusText);
      } else {
        return response.body.toString();
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

  // Delete Data
  Future<String> deleteCommand(int id) async {
    try {
      final response =
          await delete("https://commander.onthewifi.com/api/commands/$id");
      if (response.status.hasError) {
        log('<<===FAILED TO DELETE COMMAND ==> ' + response.statusText);
        return Future.error(response.statusText);
      } else {
        return response.body.toString();
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }
}
