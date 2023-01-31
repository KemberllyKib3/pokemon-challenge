import 'package:pokemon_challenge/domain/entities/entities.dart';

abstract class PokemonRepository {
  Future<List<Pokemon>> findManyFavorites();
  Future<Pokemon?> findUniqueById(int id);
  Future<void> removeFavorite(int id);
  Future<void> addFavorite(Pokemon pokemon);
}
