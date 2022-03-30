import 'package:codenames_client/features/game/presentation/pages/game_page.dart';
import 'package:codenames_client/features/home/presentation/pages/home_page.dart';
import 'package:codenames_client/features/lobby/presentation/pages/lobby_page.dart';
import 'package:flutter/widgets.dart';

class NavigationPaths {
  static Map<String, WidgetBuilder> all = {
    '/': (context) => const HomePage(),
    lobbyPath: (context) => const LobbyPage(),
    gamePath: (context) => const GamePage(),
  };

  static const String lobbyPath = '/lobby';
  static const String gamePath = '/game';
}
