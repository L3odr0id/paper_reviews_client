import 'player.dart';

class Team {
  final List<Player> slaves;
  final Player master;

  final TeamColor teamColor;
  final TeamState teamState;

  const Team({
    required this.master,
    required this.slaves,
    required this.teamColor,
    required this.teamState,
  });
}

enum TeamColor {
  yellow,
  green,
  red,
  blue,
  purple,
  orange,
  turquoise,
}

enum TeamState {
  system,
  user,
}
