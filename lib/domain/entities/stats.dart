class Stats {
  final String title;
  final int stat;

  Stats({
    required this.title,
    required this.stat,
  });

  String get initials {
    switch (title) {
      case 'hp':
        return 'HP';
      case 'attack':
        return 'ATK';
      case 'defense':
        return 'DEF';
      case 'special-attack':
        return 'SP.ATK';
      case 'special-defense':
        return 'SP.DEF';
      case 'speed':
        return 'SPD';
      default:
        return '';
    }
  }
}
