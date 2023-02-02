// ignore_for_file: public_member_api_docs, sort_constructors_first
class Stats {
  final String title;
  final int stat;

  Stats({
    required this.title,
    required this.stat,
  })  : assert(title.isNotEmpty),
        assert(stat >= 0);

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
