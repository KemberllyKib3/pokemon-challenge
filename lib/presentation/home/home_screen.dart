// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:pokemon_challenge/presentation/home/components/custom_drawer.dart';
import 'package:pokemon_challenge/presentation/home/components/home_favorites.dart';
import 'package:pokemon_challenge/presentation/home/components/home_pokemons.dart';
import 'package:pokemon_challenge/shared/shared.dart';
import 'package:pokemon_challenge/shared/widgets/widgets_functions.dart';

class HomeScreen extends StatefulWidget {
  final int? initialScreen;

  const HomeScreen({
    Key? key,
    this.initialScreen = 0,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late int _currentIndex;
  @override
  void initState() {
    _currentIndex = widget.initialScreen!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WidgetsFunctions.bigAppBar(context),
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
      drawer: const CustomDrawer(),
    );
  }
}
