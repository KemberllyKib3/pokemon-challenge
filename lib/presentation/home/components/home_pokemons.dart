import 'package:flutter/material.dart';
import 'package:pokemon_challenge/domain/entities/entities.dart';
import 'package:pokemon_challenge/presentation/filter/filter_screen.dart';
import 'package:pokemon_challenge/presentation/poke_details/poke_details_screen.dart';
import 'package:pokemon_challenge/shared/shared.dart';
import 'package:pokemon_challenge/shared/widgets/custom_card_widget.dart';

class HomePokemons extends StatefulWidget {
  const HomePokemons({Key? key}) : super(key: key);

  @override
  State<HomePokemons> createState() => _HomePokemonsState();
}

class _HomePokemonsState extends State<HomePokemons> {
  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();

    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: searchController,
            maxLines: 1,
            decoration: InputDecoration(
              hintText: 'Which pokemon are you looking for?',
              hintStyle: const TextStyle(
                color: AppColors.gray,
                fontSize: 14,
              ),
              suffixIcon: const Icon(
                Icons.search_rounded,
                color: AppColors.gray,
                size: 24,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 1,
                  color: AppColors.gray,
                ),
                borderRadius: BorderRadius.circular(50),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 2,
                  color: AppColors.gray,
                ),
                borderRadius: BorderRadius.circular(50),
              ),
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 1,
                  color: AppColors.gray,
                ),
                borderRadius: BorderRadius.circular(50),
              ),
              constraints: const BoxConstraints(maxHeight: 55),
              filled: true,
              fillColor: AppColors.white,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FilterScreen(
                      typeFilter: TypeFilter.type,
                    ),
                  ),
                ),
                child: Ink(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.red,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Text(
                    'Filter by type',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: AppColors.red,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Text(
                  'Filter by habitat',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: listPokemon.map(
              (pokemon) {
                return CustomCardWidget(
                  pokemon: pokemon,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PokeDetailsScreen(pokemon: pokemon),
                    ),
                  ),
                );
              },
            ).toList(),
          ),
        ],
      ),
    );
  }

  List<Pokemon> listPokemon = [
    Pokemon(
      id: 1,
      name: "Bulbasaur",
      baseExperience: 64,
      imageUrl:
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png",
      weight: 69,
      height: 7,
      isFavorite: false,
      color: "green",
      eggGroups: ["monster", "grass"],
      types: [
        Types(name: "grass"),
        Types(name: "poison"),
      ],
      stats: [
        Stats(title: "hp", stat: 45),
        Stats(title: "attack", stat: 49),
        Stats(title: "defense", stat: 49),
        Stats(title: "special-attack", stat: 65),
        Stats(title: "special-defense", stat: 65),
        Stats(title: "speed", stat: 45),
      ],
      abilities: [
        "overgrow",
        "chlorophyll",
      ],
      moves: [
        "razor-wind",
        "swords-dance, cut",
        "bind",
        "vine-whip",
        "headbutt",
        "tackle",
        "body-slam",
      ],
      habitats: ["grassland"],
    ),
  ];
}
