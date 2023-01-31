// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:pokemon_challenge/domain/entities/entities.dart';
import 'package:pokemon_challenge/domain/exceptions/failure.dart';
import 'package:pokemon_challenge/domain/repositories/pokemon_repository.dart';
import 'package:pokemon_challenge/domain/services/pokemon_service.dart';

class HomeUsecases {
  final PokemonRepository pokemonRepository;
  final PokemonService pokemonService;

  HomeUsecases({
    required this.pokemonRepository,
    required this.pokemonService,
  });

  Future<Either<Failure, List<Pokemon>>> getPokemons({int page = 1}) async {
    try {
      final pokemonsServ = await pokemonService.findMany(page);
      final pokemonsRepo = await pokemonRepository.findManyFavorites();

      if (pokemonsRepo.isEmpty) {
        return Right(pokemonsServ);
      } else {
        for (final pokemonServ in pokemonsServ) {
          for (final pokemonRepo in pokemonsRepo) {
            if (pokemonServ.id == pokemonRepo.id) {
              pokemonServ.isFavorite = true;
            }
          }
        }
      }
      return Right(pokemonsServ);
    } catch (e, stacktrace) {
      log(
        e.toString(),
        name: 'HomeUsecases.getPokemons',
        error: e,
        stackTrace: stacktrace,
      );
      return Left(InternalError(message: e.toString()));
    }
  }

  Future<Either<Failure, List<Pokemon>>> getFavorites() async {
    try {
      final pokemons = await pokemonRepository.findManyFavorites();
      for (var pokemon in pokemons) {
        pokemon.isFavorite = true;
      }
      return Right(pokemons);
    } catch (e, stacktrace) {
      log(
        e.toString(),
        name: 'HomeUsecases.getFavorites',
        error: e,
        stackTrace: stacktrace,
      );
      return Left(InternalError(message: e.toString()));
    }
  }
}
