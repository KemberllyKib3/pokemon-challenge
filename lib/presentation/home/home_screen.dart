import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokemon_challenge/domain/entities/pokemon.dart';
import 'package:pokemon_challenge/domain/entities/stats.dart';
import 'package:pokemon_challenge/domain/entities/types.dart';
import 'package:pokemon_challenge/shared/shared.dart';
import 'package:pokemon_challenge/shared/widgets/custom_card_widget.dart';
import 'package:pokemon_challenge/shared/widgets/widgets_functions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetsFunctions.bigAppBar(
        context,
        leading: IconButton(
          icon: const Icon(
            Icons.menu_rounded,
            color: AppColors.white,
            size: 30,
          ),
          onPressed: () {},
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _searchController,
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
                    'Filter by type',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 15,
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
                children: listPokemon.map((pokemon) {
                  return CustomCardWidget(pokemon: pokemon);
                }).toList()),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        backgroundColor: AppColors.white,
        selectedItemColor: AppColors.blue,
        onTap: (index) {
          setState(() => _currentIndex = index);
        },
        items: [
          BottomNavigationBarItem(
            icon: SizedBox.square(
              dimension: 23,
              child: SvgPicture.asset(
                AppAssets.pokeball,
                fit: BoxFit.contain,
                color: _currentIndex == 0 ? AppColors.blue : AppColors.gray,
              ),
            ),
            label: 'Pokedex',
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.star_outline_rounded,
              size: 30,
            ),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }

  List<Pokemon> listPokemon = [
    Pokemon(
      id: 1,
      name: "Bulbasaur",
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
    Pokemon(
      id: 1,
      name: "Bulbasaur",
      imageUrl:
          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png",
      weight: 69,
      height: 7,
      isFavorite: true,
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
    )
  ];
}
