import 'package:codenames_client/common/navigation_paths.dart';
import 'package:codenames_client/src/report/report_store.dart';
import 'package:flutter/material.dart';
import 'package:codenames_client/core/setup.dart' as di;
import 'package:provider/provider.dart';

const bool isProd = true;

void main() {
  di.setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ReportStore>(create: (_) => ReportStore()..fetchReports()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        routes: NavigationPaths.all,
      ),
    );
  }
}
