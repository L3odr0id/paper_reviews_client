import 'package:codenames_client/core/models/report.dart';
import 'package:codenames_client/src/reports_list.dart';
import 'package:flutter/material.dart';

class RealPage extends StatelessWidget {
  RealPage({Key? key, required this.reports}) : super(key: key);

  final List<Review> reports;
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding:
              const EdgeInsets.only(top: 24, left: 16, right: 16, bottom: 16),
          child: TextField(
            controller: searchController,
            decoration:
                const InputDecoration(hintText: 'Введите текст для поиска'),
          ),
        ),
        ReportsList(controller: searchController, reports: reports),
      ],
    );
  }
}
