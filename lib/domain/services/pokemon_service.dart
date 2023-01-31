import 'package:pokemon_challenge/domain/entities/entities.dart';

abstract class PokemonService {
  Future<List<Pokemon>> findMany(int page);
  Future<Pokemon> findUniqueById(int id);
  Future<List<Pokemon>> findManyByType(String name);
  Future<List<Pokemon>> findManyByHabitat(String name);
  Future<List<Types>> findManyTypes();
  Future<List<String>> findManyHabitats();
}
