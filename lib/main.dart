import 'package:codenames_client/common/navigation_paths.dart';
import 'package:codenames_client/src/report/report_store.dart';
import 'package:codenames_client/src/user/user_store.dart';
import 'package:flutter/material.dart';
import 'package:codenames_client/core/setup.dart' as di;
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

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
    if (!kIsWeb) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitDown,
        DeviceOrientation.portraitUp,
      ]);
    }

    return MultiProvider(
      providers: [
        Provider<ReportStore>(create: (_) => Get.find()),
        Provider<UserStore>(create: (_) => Get.find()),
      ],
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.deepPurple),
        title: 'Flutter Demo',
        routes: NavigationPaths.all,
      ),
    );
  }
}
