import 'dart:developer';

import 'package:codenames_client/core/models/report.dart';
import 'package:codenames_client/src/report/report_network_service.dart';
import 'package:codenames_client/src/user/user_store.dart';
import 'package:mobx/mobx.dart';

part 'report_store.g.dart';

class ReportStore = _ReportStore with _$ReportStore;

abstract class _ReportStore with Store {
  final ReportNetworkService httpClient = ReportNetworkService();

  @observable
  Status status = Status.initial;

  @observable
  ObservableList<Report> reportList = ObservableList.of([]);

  @action
  Future fetchReports() async {
    status = Status.loading;
    try {
      reportList = ObservableList.of(await httpClient.getReports());
      status = Status.loaded;
    } catch (e) {
      log(e.toString());
    }
  }

  @action
  Future<String?> postReports(Report report) async {
    status = Status.loading;

    final newReport = await httpClient.postReport(report);
    final newList = List<Report>.from(reportList)..add(newReport);
    reportList = ObservableList.of(newList);

    status = Status.loaded;
  }

  @action
  Future putReports(Report report) async {
    status = Status.loading;

    final newReport = await httpClient.putReport(report);
    final newList = List<Report>.from(reportList);
    final index = newList.indexWhere((element) => element.id == newReport.id);
    if (index == -1) {
      return 'Not found';
    }
    newList[index] = newReport;
    reportList = ObservableList.of(newList);

    status = Status.loaded;
  }

  @action
  Future deleteReports(Report report) async {
    status = Status.loading;

    final newReport = await httpClient.deleteReport(report);
    final newList = List<Report>.from(reportList);
    newList.removeWhere((element) => element.id == newReport.id);
    reportList = ObservableList.of(newList);

    status = Status.loaded;
  }
}
