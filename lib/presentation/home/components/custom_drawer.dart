import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokemon_challenge/injector.dart';
import 'package:pokemon_challenge/presentation/filter/bloc/filter.dart';
import 'package:pokemon_challenge/presentation/filter/filter_screen.dart';
import 'package:pokemon_challenge/presentation/home/home_screen.dart';
import 'package:pokemon_challenge/shared/shared.dart';
import 'package:pokemon_challenge/shared/widgets/widgets_functions.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: AppColors.white,
        elevation: 1,
        width: MediaQuery.of(context).size.width * 0.75,
        child: Column(
          children: [
            Container(
              height: 120,
              width: double.infinity,
              padding: const EdgeInsets.only(bottom: 20),
              color: AppColors.red,
              child: const Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  'PokéChallenge',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: SizedBox.square(
                dimension: 23,
                child: SvgPicture.asset(
                  AppAssets.pokeball,
                  fit: BoxFit.contain,
                  color: AppColors.gray,
                ),
              ),
              title: const Text('Home'),
              onTap: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.favorite_outline_rounded),
              title: const Text('Favorites'),
              onTap: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(initialScreen: 1),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.filter_alt_outlined),
              title: const Text('Filter by type'),
              onTap: () => WidgetsFunctions.push(
                context,
                (context) => BlocProvider<FilterBloc>(
                  create: (context) => getIt<FilterBloc>(),
                  child: const FilterScreen(
                    typeFilter: TypeFilter.type,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.filter_alt_outlined),
              title: const Text('Filter by habitat'),
              onTap: () => WidgetsFunctions.push(
                context,
                (context) => BlocProvider<FilterBloc>(
                  create: (context) => getIt<FilterBloc>(),
                  child: const FilterScreen(
                    typeFilter: TypeFilter.habitat,
                  ),
                ),
              ),
            ),
            Expanded(child: Container()),
            ListTile(
              leading: const Icon(Icons.code_rounded),
              title: const Text('Developed by Kemberlly'),
              onTap: () => WidgetsFunctions.openUrl(
                'https://github.com/KemberllyKib3',
              ),
            ),
            ListTile(
              leading: const Icon(Icons.warning_amber_rounded),
              title: const Text('Challenge description'),
              onTap: () => WidgetsFunctions.openUrl(
                'https://github.com/KemberllyKib3/pokemon-challenge/blob/main/README.md',
              ),
            ),
          ],
        ));
  }
}
