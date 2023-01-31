import 'package:hive/hive.dart';

part 'pokemon_model.g.dart';

@HiveType(typeId: 1)
class PokemonModel {
  @HiveField(0)
  int id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String imageUrl;

  @HiveField(3)
  int weight;

  @HiveField(4)
  int height;

  @HiveField(5)
  int baseExperience;

  @HiveField(6)
  bool isFavorite;

  @HiveField(7)
  String color;

  @HiveField(8)
  List<String> eggGroups;

  @HiveField(9)
  List<String> types;

  @HiveField(10)
  List<Map<String, int>> stats;

  @HiveField(11)
  List<String> abilities;

  @HiveField(12)
  List<String> moves;

  @HiveField(13)
  List<String> habitats;

  PokemonModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.weight,
    required this.height,
    required this.baseExperience,
    required this.isFavorite,
    required this.color,
    required this.eggGroups,
    required this.types,
    required this.stats,
    required this.abilities,
    required this.moves,
    required this.habitats,
  });
}
