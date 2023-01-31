// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:pokemon_challenge/domain/entities/stats.dart';
import 'package:pokemon_challenge/domain/entities/types.dart';

class Pokemon {
  int id;
  String name;
  String imageUrl;
  int? weight;
  int? height;
  int? baseExperience;
  bool? isFavorite;
  String? color;
  List<String>? eggGroups;
  List<Types>? types;
  List<Stats>? stats;
  List<String>? abilities;
  List<String>? moves;
  List<String>? habitats;

  Pokemon({
    required this.id,
    required this.name,
    required this.imageUrl,
    this.weight,
    this.height,
    this.baseExperience,
    this.isFavorite,
    this.color,
    this.eggGroups,
    this.types,
    this.stats,
    this.abilities,
    this.moves,
    this.habitats,
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
