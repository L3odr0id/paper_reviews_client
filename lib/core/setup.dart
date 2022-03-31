import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';

void setup() {
  Get.put<Dio>(Dio());
}
