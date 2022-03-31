class Player {
  final String name;
  final String uuid;
  final PlayerState playerState;

  const Player({
    required this.name,
    required this.playerState,
    required this.uuid,
  });
}

enum PlayerState { anonymus, authorized }
