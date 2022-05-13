import 'package:codenames_client/core/models/report.dart';
import 'package:codenames_client/src/report_tile.dart';
import 'package:flutter/material.dart';

class ReportsList extends StatefulWidget {
  const ReportsList({
    Key? key,
    required this.controller,
    required this.reports,
  }) : super(key: key);

  final TextEditingController controller;
  final List<Review> reports;

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<ReportsList> {
  @override
  void initState() {
    widget.controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final sorted = List<Review>.from(widget.reports);
    final search = widget.controller.text;
    print('BUILD SEARC $search');
    if (search.isNotEmpty) {
      sorted.removeWhere((report) => !(report.subject.contains(search) ||
          report.title.contains(search) ||
          report.subject.contains(search) ||
          report.author.contains(search)));
    }
    return ListView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: sorted.length,
      itemBuilder: (context, index) => ReportTile(
        report: sorted[index],
      ),
    );
  }
}
