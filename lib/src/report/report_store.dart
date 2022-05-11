import 'dart:developer';

import 'package:codenames_client/core/models/report.dart';
import 'package:codenames_client/src/report/report_network_service.dart';
import 'package:mobx/mobx.dart';

part 'report_store.g.dart';

class ReportStore = _ReportStore with _$ReportStore;

abstract class _ReportStore with Store {
  final ReportNetworkService httpClient = ReportNetworkService();

  @observable
  ObservableFuture<List<Report>> reportListFuture =
      ObservableFuture<List<Report>>.value([]);

  @action
  Future fetchReports() async {
    try {
      reportListFuture = httpClient.getReports().asObservable();
    } catch (e) {
      log(e.toString());
    }
  }

  @action
  Future<String?> postReports(Report report) async {
    if (reportListFuture.status == FutureStatus.fulfilled) {
      final newReport = await httpClient.postReport(report);
      final newList = List<Report>.from(reportListFuture.result)
        ..add(newReport);
      reportListFuture = ObservableFuture<List<Report>>.value(newList);
    } else {
      return 'Previous request was not finished';
    }
    return null;
  }

  @action
  Future<String?> putReports(Report report) async {
    if (reportListFuture.status == FutureStatus.fulfilled) {
      final newReport = await httpClient.putReport(report);
      final newList = List<Report>.from(reportListFuture.result)
        ..removeWhere((element) => element.id == newReport.id)
        ..add(newReport);
      reportListFuture = ObservableFuture<List<Report>>.value(newList);
    } else {
      return 'Previous request was not finished';
    }
    return null;
  }

  @action
  Future<String?> deleteReports(Report report) async {
    if (reportListFuture.status == FutureStatus.fulfilled) {
      final newReport = await httpClient.deleteReport(report);
      final newList = List<Report>.from(reportListFuture.result)
        ..removeWhere((element) => element.id == newReport.id);
      reportListFuture = ObservableFuture<List<Report>>.value(newList);
    } else {
      return 'Previous request was not finished';
    }
    return null;
  }
}
