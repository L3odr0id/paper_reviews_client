// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ReportStore on _ReportStore, Store {
  final _$statusAtom = Atom(name: '_ReportStore.status');

  @override
  Status get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(Status value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  final _$reportListAtom = Atom(name: '_ReportStore.reportList');

  @override
  ObservableList<Report> get reportList {
    _$reportListAtom.reportRead();
    return super.reportList;
  }

  @override
  set reportList(ObservableList<Report> value) {
    _$reportListAtom.reportWrite(value, super.reportList, () {
      super.reportList = value;
    });
  }

  final _$fetchReportsAsyncAction = AsyncAction('_ReportStore.fetchReports');

  @override
  Future<dynamic> fetchReports() {
    return _$fetchReportsAsyncAction.run(() => super.fetchReports());
  }

  final _$postReportsAsyncAction = AsyncAction('_ReportStore.postReports');

  @override
  Future<String?> postReports(Report report) {
    return _$postReportsAsyncAction.run(() => super.postReports(report));
  }

  final _$putReportsAsyncAction = AsyncAction('_ReportStore.putReports');

  @override
  Future<dynamic> putReports(Report report) {
    return _$putReportsAsyncAction.run(() => super.putReports(report));
  }

  final _$deleteReportsAsyncAction = AsyncAction('_ReportStore.deleteReports');

  @override
  Future<dynamic> deleteReports(Report report) {
    return _$deleteReportsAsyncAction.run(() => super.deleteReports(report));
  }

  @override
  String toString() {
    return '''
status: ${status},
reportList: ${reportList}
    ''';
  }
}
