import 'package:pokemon_challenge/data/models/pokemon_model.dart';

abstract class PokemonDatasource {
  Future<List<PokemonModel>?> findMany();
  Future<PokemonModel?> findUniqueById(int id);
  Future<void> save(PokemonModel model);
  Future<void> delete(int id);
}
