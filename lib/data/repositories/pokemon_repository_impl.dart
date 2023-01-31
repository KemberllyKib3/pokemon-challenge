import 'package:pokemon_challenge/data/datasources/pokemon_datasource.dart';
import 'package:pokemon_challenge/data/extension_methods/entities_to_model.dart';
import 'package:pokemon_challenge/data/extension_methods/model_to_entities.dart';
import 'package:pokemon_challenge/data/models/pokemon_model.dart';
import 'package:pokemon_challenge/domain/entities/pokemon.dart';
import 'package:pokemon_challenge/domain/repositories/pokemon_repository.dart';
import 'package:pokemon_challenge/injector.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  @override
  Future<void> addFavorite(Pokemon pokemon) async {
    PokemonModel model = pokemon.converta;

    await getIt.get<PokemonDatasource>().save(model);
  }

  @override
  Future<List<Pokemon>> findManyFavorites() async {
    List<PokemonModel>? models =
        await getIt.get<PokemonDatasource>().findMany();

    return models?.map((e) => e.converta).toList() ?? [];
  }

  @override
  Future<Pokemon?> findUniqueById(int id) async {
    PokemonModel? model =
        await getIt.get<PokemonDatasource>().findUniqueById(id);

    return model?.converta;
  }

  @override
  Future<void> removeFavorite(int id) async {
    await getIt.get<PokemonDatasource>().delete(id);
  }
}
