import 'package:pokemon_challenge/domain/entities/entities.dart';
import 'package:pokemon_challenge/domain/services/api_functions/api_functions.dart';
import 'package:pokemon_challenge/domain/services/pokemon_service.dart';

class PokemonServiceImpl implements PokemonService {
  @override
  Future<List<Pokemon>> findMany(int page) async {
    final response =
        await ApiService().get(path: 'pokemon?offset=0&limit=${page * 5}');
    return ApiUtils.handleResponseList(response, mapListPokemon);
  }

  @override
  Future<List<String>> findManyHabitats() async {
    final response = await ApiService().get(path: 'pokemon-habitat');
    return ApiUtils.handleResponseList(response, mapHabitats);
  }

  @override
  Future<List<String>> findManyTypes() async {
    final response = await ApiService().get(path: 'type');
    return ApiUtils.handleResponseList(response, mapTypes);
  }

  @override
  Future<Pokemon> findUniqueById(int id) async {
    final response = await ApiService().get(path: 'pokemon/$id/');
    return ApiUtils.handleResponse(response, mapPokemon);
  }

  @override
  Future<List<Pokemon>> findManyByHabitat(String habitat) async {
    final response = await ApiService().get(path: 'pokemon-habitat/$habitat');
    return ApiUtils.handleResponseList(response, mapListPokemonFromHabitat);
  }

  @override
  Future<List<Pokemon>> findManyByType(String type) async {
    final response = await ApiService().get(path: 'type/$type');
    return ApiUtils.handleResponseList(response, mapListPokemonFromType);
  }

  @override
  Future<Pokemon> findManyByName(String name) async {
    final response = await ApiService().get(path: 'pokemon/$name/');
    return ApiUtils.handleResponse(response, mapPokemon);
  }

  Future<List<Pokemon>> mapListPokemon(dynamic data) async {
    List<Pokemon> list = [];
    for (var item in data['results']) {
      final response = await ApiService().get(url: item['url']);
      list.add(await mapPartialPokemon(response.data));
    }
    return list;
  }

  Future<List<Pokemon>> mapListPokemonFromHabitat(dynamic data) async {
    List<Pokemon> list = [];
    for (var item in (data['pokemon_species'] as List).getRange(0, 15)) {
      final response = await ApiService().get(url: item['url']);
      list.add(await mapPartialPokemonHabitat(response.data));
    }
    return list;
  }

  Future<List<Pokemon>> mapListPokemonFromType(dynamic data) async {
    List<Pokemon> list = [];
    for (var item in (data['pokemon'] as List).getRange(0, 15)) {
      final response = await ApiService().get(url: item['pokemon']['url']);
      list.add(await mapPartialPokemon(response.data));
    }
    return list;
  }

  Future<Pokemon> mapPartialPokemonHabitat(dynamic data) async {
    dynamic response =
        await ApiService().get(url: data['varieties'][0]['pokemon']['url']);

    return Pokemon(
      id: data['id'],
      name: data['name'],
      imageUrl: response.data['sprites']['other']['official-artwork']
          ['front_default'],
      color: data['color']['name'],
      isFavorite: false,
    );
  }

  Future<Pokemon> mapPartialPokemon(dynamic data) async {
    dynamic response = await ApiService().get(url: data['species']['url']);

    return Pokemon(
      id: data['id'],
      name: data['name'],
      imageUrl: data['sprites']['other']['official-artwork']['front_default'],
      color: response.data['color']['name'],
      isFavorite: false,
    );
  }

  Future<Pokemon> mapPokemon(dynamic data) async {
    final response = await ApiService().get(url: data['species']['url']);
    final habitat = response.data['habitat']['name'];
    final color = response.data['color']['name'];
    final eggGroups = (response.data['egg_groups'] as List)
        .map((e) => e['name'].toString())
        .toList();

    return Pokemon(
      id: data['id'],
      name: data['name'],
      height: data['height'],
      weight: data['weight'],
      baseExperience: data['base_experience'],
      imageUrl: data['sprites']['other']['official-artwork']['front_default'],
      moves: mapListMoves(data: data['moves']),
      types: (data['types'] as List)
          .map((e) => Types(name: e['type']['name']))
          .toList(),
      abilities: (data['abilities'] as List)
          .map((e) => e['ability']['name'].toString())
          .toList(),
      stats: (data['stats'] as List)
          .map((e) => Stats(title: e['stat']['name'], stat: e['base_stat']))
          .toList(),
      habitats: [habitat],
      color: color,
      eggGroups: eggGroups,
      isFavorite: false,
    );
  }

  List<String> mapListMoves({required dynamic data, int max = 15}) {
    List<String> moves = [];
    for (var i = 0; i < max; i++) {
      moves.add(data[i]['move']['name']);
    }
    return moves;
  }

  List<String> mapTypes(dynamic data) {
    return (data['results'] as List)
        .map(
          (e) => e['name'].toString(),
        )
        .toList();
  }

  List<String> mapHabitats(dynamic data) {
    return (data['results'] as List)
        .map(
          (e) => e['name'].toString(),
        )
        .toList();
  }
}
