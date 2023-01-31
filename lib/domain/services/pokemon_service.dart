import 'package:pokemon_challenge/domain/entities/entities.dart';

abstract class PokemonService {
  Future<List<Pokemon>> findMany(int page);
  Future<Pokemon> findUniqueById(int id);
  Future<List<Pokemon>> findManyByType(String type);
  Future<List<Pokemon>> findManyByHabitat(String habitat);
  Future<Pokemon?> findManyByName(String name);
  Future<List<String>> findManyTypes();
  Future<List<String>> findManyHabitats();
}
