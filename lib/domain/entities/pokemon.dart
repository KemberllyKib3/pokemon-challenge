import 'package:flutter/material.dart';
import 'package:pokemon_challenge/domain/entities/stats.dart';
import 'package:pokemon_challenge/domain/entities/types.dart';

class Pokemon {
  final int id;
  final String name;
  final String imageUrl;
  final double weight;
  final double height;
  final bool isFavorite;
  final String color;
  final List<String> eggGroups;
  final List<Types> types;
  final List<Stats> stats;
  final List<String> abilities;
  final List<String> moves;
  final List<String> habitats;

  Pokemon({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.weight,
    required this.height,
    required this.isFavorite,
    required this.color,
    required this.eggGroups,
    required this.types,
    required this.stats,
    required this.abilities,
    required this.moves,
    required this.habitats,
  });

  Color get getColor {
    switch (color) {
      case 'green':
        return Colors.green[300]!;
      case 'red':
        return Colors.red[300]!;
      case 'blue':
        return Colors.blue[300]!;
      case 'yellow':
        return Colors.yellow[300]!;
      case 'brown':
        return Colors.brown[300]!;
      case 'purple':
        return Colors.purple[300]!;
      case 'pink':
        return Colors.pink[300]!;
      case 'gray':
        return Colors.grey[300]!;
      default:
        return Colors.grey[300]!;
    }
  }
}
