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

  final _$_ReportStoreActionController = ActionController(name: '_ReportStore');

  @override
  Future<dynamic> fetchReports() {
    final _$actionInfo = _$_ReportStoreActionController.startAction(
        name: '_ReportStore.fetchReports');
    try {
      return super.fetchReports();
    } finally {
      _$_ReportStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<bool> postReports(Report report) {
    final _$actionInfo = _$_ReportStoreActionController.startAction(
        name: '_ReportStore.postReports');
    try {
      return super.postReports(report);
    } finally {
      _$_ReportStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
reportListFuture: ${reportListFuture}
    ''';
  }
}
