class Players {
  String? player;

  Players({
    this.player,
  });

  factory Players.fromJson(Map<String, dynamic> json) {
    return Players(
      player: json['player'],
    );
  }
}
