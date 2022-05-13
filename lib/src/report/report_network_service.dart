import 'dart:developer';

import 'package:codenames_client/common/api_router.dart';
import 'package:codenames_client/core/models/report.dart';
import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';

class ReportNetworkService {
  Future<List<Review>> getReports() async {
    final dio = Get.find<Dio>();
    final urlReportsAll = Get.find<ApiRouter>().reportsAll;

    final response = await dio.get(urlReportsAll);

    if (response.statusCode == 200) {
      final List<Review> reports = (response.data as List<dynamic>)
          .map<Review>((e) => Review.fromJSON(e as Map<String, dynamic>))
          .toList();
      log('Got ${reports.length} reports');
      return reports;
    } else {
      throw "Error in $urlReportsAll";
    }
  }

  Future<Review> postReport(Review report) async {
    final dio = Get.find<Dio>();
    final urlReportsPost = Get.find<ApiRouter>().reportPost;
    try {
      final response = await dio.post(urlReportsPost, data: report.toJson());

      if (response.statusCode == 200) {
        return Review.fromJSON(response.data);
      } else {
        throw "Error in $urlReportsPost";
      }
    } catch (e) {
      print(e);
      print(report.toJson());
      rethrow;
    }
  }

  Future<Review> putReport(Review report) async {
    final dio = Get.find<Dio>();
    final urlReportPut = Get.find<ApiRouter>().reportPut;

    final response = await dio.put(urlReportPut, data: report.toJson());

    if (response.statusCode == 200) {
      return Review.fromJSON(response.data);
    } else {
      throw "Error in $urlReportPut";
    }
  }

  Future<Review> deleteReport(Review report) async {
    final dio = Get.find<Dio>();
    final urlReportDel = Get.find<ApiRouter>().reportDelete(report);

    final response = await dio.delete(urlReportDel);

    if (response.statusCode == 200) {
      return report;
    } else {
      throw "Error in $urlReportDel delete";
    }
  }
}
