import 'package:pokemon_challenge/data/models/pokemon_model.dart';
import 'package:pokemon_challenge/domain/entities/entities.dart';

extension ConversaoPokemon on PokemonModel {
  Pokemon get converta => Pokemon(
        id: id,
        name: name,
        imageUrl: imageUrl,
        height: height,
        weight: weight,
        stats: stats
            .map((stat) =>
                Stats(title: stat.keys.first, stat: stat.values.first))
            .toList(),
        baseExperience: baseExperience,
        color: color,
        eggGroups: eggGroups,
        types: types.map((e) => Types(name: e)).toList(),
        habitats: habitats,
        isFavorite: isFavorite,
        moves: moves,
        abilities: abilities,
      );
}
