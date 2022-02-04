import 'package:dio/dio.dart';
import 'package:gcms/constants/constant.dart';

class BaseProvider {
  final Dio dio = Dio(BaseOptions(
    connectTimeout: kConnectionTimeout,
    receiveTimeout: kReceiveTimeout,
    baseUrl: kNewApiBaseURL,
    contentType: 'application/json',
    responseType: ResponseType.plain,
    receiveDataWhenStatusError: true,
  ));
}
