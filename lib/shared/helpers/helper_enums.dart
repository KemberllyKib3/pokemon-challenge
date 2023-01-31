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
}
