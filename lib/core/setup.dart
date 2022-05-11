import 'package:codenames_client/common/api_router.dart';
import 'package:codenames_client/src/report/report_store.dart';
import 'package:codenames_client/src/user/user_store.dart';
import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';

void setup() {
  Get.put<Dio>(Dio());
  Get.put<ApiRouter>(ApiRouter());

  Get.put<ReportStore>(ReportStore()..fetchReports());
  Get.put<UserStore>(UserStore());
}
