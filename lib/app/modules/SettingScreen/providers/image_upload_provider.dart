import 'dart:io';

import 'package:dio/dio.dart';
import 'package:gcms/app/modules/utils/base_provider.dart';
import 'package:gcms/app/services/slack_logger.dart';
import 'package:gcms/constants/constant.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';

class ImageUploadProvider extends BaseProvider {
  Future<String> uploadImage(File file, String id) async {
    try {
      final mimeTypeData =
          lookupMimeType(file.path, headerBytes: [0xFF, 0xD8])?.split('/');
      FormData form = new FormData.fromMap({
        'image': await MultipartFile.fromFile(
          file.path,
          filename: file.path,
          contentType: MediaType(mimeTypeData![0], mimeTypeData[1]),
        ),
        'name': id,
        'container': 'users',
      });

      final response = await dio.post(
        "$kNewApiBaseURL/api/upload-profile-image",
        data: form,
      );
      print('The file ----> $form');
      print(response.data.toString());
      return response.data.toString();
    } on DioError catch (exception) {
      if (exception.response != null) {
        if (exception.response!.statusCode == 400) {
          logToChannel(
              {"text": "$kError UPLOAD FAILURE\n ${exception.response!.data}"});
          return Future.error(exception.response!.data["message"].toString());
        }
        logToChannel({"text": "$kError UPLOAD FAILURE\n $exception"});
        return Future.error(exception.response!.statusMessage.toString());
      }
      print(exception.response!.statusMessage.toString());
      logToChannel({"text": "$kError UPLOAD FAILURE\n $exception"});
      print('<<===UPLOAD EXCEPTION ==> $exception');
      return Future.error(
          "An error occured please check your internet connection.".toString());
    }
  }
}
