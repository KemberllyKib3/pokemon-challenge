import 'package:pokemon_challenge/data/models/pokemon_model.dart';
import 'package:pokemon_challenge/domain/entities/entities.dart';

extension ConversaoPokemonModel on Pokemon {
  PokemonModel get converta => PokemonModel(
        id: id,
        name: name,
        imageUrl: imageUrl,
        height: height!,
        weight: weight!,
        stats: stats!.map((stat) => {stat.title: stat.stat}).toList(),
        baseExperience: baseExperience!,
        color: color!,
        eggGroups: eggGroups!,
        types: types!.map((e) => e.name).toList(),
        habitats: habitats!,
        isFavorite: isFavorite!,
        moves: moves!,
        abilities: abilities!,
      );
}