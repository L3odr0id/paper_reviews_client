import 'package:codenames_client/common/api_router.dart';
import 'package:codenames_client/core/models/report.dart';
import 'package:codenames_client/src/report/report_store.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<ReportStore>(context);
    final future = store.reportListFuture;
    return Scaffold(
      appBar: AppBar(
        title: Text('Сервис отзывов'),
      ),
      body: Observer(
        builder: (_) {
          switch (future.status) {
            case FutureStatus.pending:
              print(FutureStatus.pending);
              return const Center(
                child: CircularProgressIndicator(),
              );

            case FutureStatus.rejected:
              print(FutureStatus.rejected);
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'Failed to load items.',
                      style: TextStyle(color: Colors.red),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      child: const Text('Tap to retry'),
                      onPressed: () => store.fetchReports(),
                    )
                  ],
                ),
              );

            case FutureStatus.fulfilled:
              print(FutureStatus.fulfilled);
              final List<Report> reports = future.result;

              return Center(child: Text(reports.length.toString()));

            default:
              return const Center(
                child: CircularProgressIndicator(),
              );
          }
        },
      ),
    );
  }
}
