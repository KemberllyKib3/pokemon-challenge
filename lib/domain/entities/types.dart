import 'package:flutter/material.dart';

class Types {
  final String name;

  Types({
    required this.name,
  });

  Color get color {
    switch (name) {
      case 'normal':
        return Colors.brown[300]!;
      case 'fighting':
        return Colors.red[900]!;
      case 'flying':
        return Colors.blue[300]!;
      case 'poison':
        return Colors.purple[300]!;
      case 'ground':
        return Colors.brown[600]!;
      case 'rock':
        return Colors.brown[800]!;
      case 'bug':
        return Colors.green[300]!;
      case 'ghost':
        return Colors.purple[900]!;
      case 'steel':
        return Colors.blueGrey[300]!;
      case 'fire':
        return Colors.red[300]!;
      case 'water':
        return Colors.blue[300]!;
      case 'grass':
        return Colors.green[600]!;
      case 'electric':
        return Colors.yellow[600]!;
      case 'psychic':
        return Colors.pink[300]!;
      case 'ice':
        return Colors.blue[100]!;
      case 'dragon':
        return Colors.red[900]!;
      case 'dark':
        return Colors.brown[900]!;
      case 'fairy':
        return Colors.pink[100]!;
      case 'unknown':
        return Colors.grey[300]!;
      case 'shadow':
        return Colors.grey[900]!;
      default:
        return Colors.grey[300]!;
    }
  }
}
