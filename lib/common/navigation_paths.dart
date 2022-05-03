import 'package:codenames_client/src/home_page.dart';
import 'package:flutter/widgets.dart';

class NavigationPaths {
  static Map<String, WidgetBuilder> all = {
    '/': (context) => const HomePage(),
  };
}
