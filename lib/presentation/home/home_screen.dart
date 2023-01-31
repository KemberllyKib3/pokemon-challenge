import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokemon_challenge/presentation/home/components/home_favorites.dart';
import 'package:pokemon_challenge/presentation/home/components/home_pokemons.dart';
import 'package:pokemon_challenge/shared/shared.dart';
import 'package:pokemon_challenge/shared/widgets/widgets_functions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

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
      body: [
        const HomePokemons(),
        const HomeFavorites(),
      ][_currentIndex],
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
              Icons.favorite_outline_rounded,
              size: 29,
            ),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
