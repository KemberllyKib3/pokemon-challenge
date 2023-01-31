import 'package:flutter/material.dart';
import 'package:pokemon_challenge/presentation/home/home_screen.dart';
import 'package:pokemon_challenge/shared/shared.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PokéChallenge',
      theme: buildTheme(),
      home: const HomeScreen(),
    );
  }
}
