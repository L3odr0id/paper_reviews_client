import 'package:codenames_client/core/models/report.dart';
import 'package:codenames_client/src/network_service.dart';
import 'package:mobx/mobx.dart';

part 'report_store.g.dart';

class ReportStore = _ReportStore with _$ReportStore;

abstract class _ReportStore with Store {
  final NetworkService httpClient = NetworkService();

  @observable
  ObservableFuture<List<Report>> reportListFuture = ObservableFuture.value([]);

  @action
  Future fetchReports() async {
    reportListFuture = ObservableFuture<List<Report>>(
        httpClient.getReports().then((reports) => reports));
  }

  @action
  Future<bool> postReports(Report report) =>
      ObservableFuture(httpClient.postReport(report));

  void getReports() {
    fetchReports();
  }

  void sendReport(Report report) {
    postReports(report);
  }
}
