import 'package:codenames_client/common/app_text_style.dart';
import 'package:codenames_client/core/models/report.dart';
import 'package:codenames_client/src/report/report_store.dart';
import 'package:codenames_client/src/user/user_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReportTile extends StatelessWidget {
  const ReportTile({Key? key, required this.report}) : super(key: key);

  final Report report;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      child: Card(
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
            _Panel(report: report),
            const SizedBox(height: 16),
          ],
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
        TextButton(
          onPressed: () {},
          child: Text('Изменить'),
        ),
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
