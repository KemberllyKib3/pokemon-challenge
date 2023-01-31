import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_challenge/initialize.dart';
import 'package:pokemon_challenge/injector.dart';
import 'package:pokemon_challenge/presentation/home/home_screen.dart';
import 'package:pokemon_challenge/shared/shared.dart';

import 'presentation/home/bloc/home.dart';

void main() {
  Initialize.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeBloc>(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'PokéChallenge',
        theme: buildTheme(),
        home: const HomeScreen(),
      ),
    );
  }
}
