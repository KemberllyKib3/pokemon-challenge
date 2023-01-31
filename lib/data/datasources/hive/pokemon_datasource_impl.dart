import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pokemon_challenge/data/datasources/pokemon_datasource.dart';
import 'package:pokemon_challenge/data/models/pokemon_model.dart';

class PokemonDatasourceImpl implements PokemonDatasource {
  static const _boxName = 'pokemon_box';

  Future<Box<PokemonModel>> _getBox() async {
    try {
      if (!Hive.isAdapterRegistered(PokemonModelAdapter().typeId)) {
        Hive.registerAdapter(PokemonModelAdapter());
      }

      if (Hive.isBoxOpen(_boxName)) return Hive.box(_boxName);

      return await Hive.openBox<PokemonModel>(_boxName);
    } on Exception catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<PokemonModel>?> findMany() async {
    final box = await _getBox();
    return box.values.toList();
  }

  @override
  Future<PokemonModel?> findUniqueById(int id) async {
    final box = await _getBox();
    return box.get(id);
  }

  @override
  Future<PokemonModel> save(PokemonModel model) async {
    final box = await _getBox();
    box.put(model.id, model);
    return model;
  }

  @override
  Future<void> delete(int id) async {
    final box = await _getBox();
    box.delete(id);
  }
}
