import 'card.dart';
import 'team.dart';

class Room {
  final List<Card> cards;

  final List<Team> teams;

  final GameState state;

  const Room({
    required this.cards,
    required this.teams,
    required this.state,
  });
}

enum GameState { starting, inProgress, finised }
