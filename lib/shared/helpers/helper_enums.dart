import 'package:flutter/material.dart';
import 'package:pokemon_challenge/shared/app_colors.dart';
import 'package:pokemon_challenge/shared/enums.dart';

class HelperEnums {
  static String searchParam(TypeFilter typeFilter) {
    switch (typeFilter) {
      case TypeFilter.type:
        return 'type';
      case TypeFilter.habitat:
        return 'pokemon-habitat';
      case TypeFilter.search:
        return 'search';
    }
  }

  static Color color(String name) {
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
        return Colors.grey[500]!;
      case 'shadow':
        return Colors.grey[900]!;
      default:
        return AppColors.red;
    }
  }

  static Color colorTypeMessage(TypeMessage typeMessage) {
    switch (typeMessage) {
      case TypeMessage.sucess:
        return AppColors.success;
      case TypeMessage.info:
        return AppColors.info;
      case TypeMessage.warning:
        return AppColors.warning;
      case TypeMessage.error:
        return AppColors.error;
    }
  }
}
