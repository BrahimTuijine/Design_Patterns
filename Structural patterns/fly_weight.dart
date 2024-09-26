enum PlayerType { red, blue }

abstract interface class Player {
  String mission;
  String weapon;

  Player({required this.mission, required this.weapon});
  void render();

  // @override
  // bool operator ==(covariant Player other) {
  //   if (identical(this, other)) return true;

  //   return other.mission == mission && other.weapon == weapon;
  // }

  // @override
  // int get hashCode => mission.hashCode ^ weapon.hashCode;
}

class RedTeamPlayer extends Player {
  RedTeamPlayer({
    super.mission = 'Caputure Red Flag',
    super.weapon = '',
  });

  @override
  void render() => print("$weapon and $mission");
}

class BlueTeamPlayer extends Player {
  BlueTeamPlayer({
    super.mission = 'Caputure Blue Flag',
    super.weapon = '',
  });

  @override
  void render() => print("$weapon and $mission");
}

class PlayerFactory {
  static final Map<PlayerType, Player> players = {};

  static Player getPlayer(PlayerType playerType) {
    if (!players.containsKey(playerType)) {
      if (playerType == PlayerType.red) {
        final player = RedTeamPlayer();
        players[playerType] = player;
        return player;
      } else {
        final player = BlueTeamPlayer();
        players[playerType] = player;
        return player;
      }
    }
    return players[playerType]!;
  }
}

void main() {
  // render some players
  final player1 = PlayerFactory.getPlayer(PlayerType.red);
  player1.weapon = "AK47";
  print("Player One");
  player1.render();

  print(player1.hashCode);

  final player2 = PlayerFactory.getPlayer(PlayerType.red);
  player2.weapon = "M4";
  print("Player Two");
  player2.render();
  print(player2.hashCode);

  print(player2 == player1);
}
