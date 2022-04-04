import 'package:codenames_client/common/api_router.dart';
import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';

void setup() {
  Get.put<Dio>(Dio());
  Get.put<ApiRouter>(ApiRouter());
}
