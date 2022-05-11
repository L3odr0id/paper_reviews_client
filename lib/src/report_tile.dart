import 'package:codenames_client/common/app_text_style.dart';
import 'package:codenames_client/core/models/report.dart';
import 'package:codenames_client/src/dialogs/edit_report.dart';
import 'package:codenames_client/src/report/report_store.dart';
import 'package:codenames_client/src/user/user_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReportTile extends StatelessWidget {
  const ReportTile({Key? key, required this.report}) : super(key: key);

  final Report report;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserStore>(context).user;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 16),
              Flexible(
                child: Text(
                  report.title,
                  style: AppTextStyles.cardTitle,
                ),
              ),
              const SizedBox(height: 8),
              Flexible(
                child: Text(
                  'Автор: ' + report.author + ' | Тема: ' + report.subject,
                ),
              ),
              const SizedBox(height: 8),
              Flexible(
                child: Text(
                  report.message,
                  style: AppTextStyles.cardBody,
                ),
              ),
              const SizedBox(height: 8),
              !report.isAnonymous && report.author == user?.login
                  ? _Panel(report: report)
                  : const SizedBox(),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class _Panel extends StatelessWidget {
  const _Panel({required this.report});

  final Report report;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // TextButton(
        //   onPressed: () {
        //     // Provider.of<ReportStore>(context, listen: false).putReports(report);
        //     showDialog(
        //       context: context,
        //       builder: (context) => EditDialog(report: report),
        //     );
        //   },
        //   child: Text('Изменить'),
        // ),
        TextButton(
          onPressed: () {
            Provider.of<ReportStore>(context, listen: false)
                .deleteReports(report);
          },
          child: Text('Удалить'),
        ),
      ],
    );
  }
}
