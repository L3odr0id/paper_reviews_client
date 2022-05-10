// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ReportStore on _ReportStore, Store {
  final _$reportListFutureAtom = Atom(name: '_ReportStore.reportListFuture');

  @override
  ObservableFuture<List<Report>> get reportListFuture {
    _$reportListFutureAtom.reportRead();
    return super.reportListFuture;
  }

  @override
  set reportListFuture(ObservableFuture<List<Report>> value) {
    _$reportListFutureAtom.reportWrite(value, super.reportListFuture, () {
      super.reportListFuture = value;
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
  Future<String?> putReports(Report report) {
    return _$putReportsAsyncAction.run(() => super.putReports(report));
  }

  @override
  String toString() {
    return '''
reportListFuture: ${reportListFuture}
    ''';
  }
}
