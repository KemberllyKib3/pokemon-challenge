import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:pokemon_challenge/domain/entities/entities.dart';
import 'package:pokemon_challenge/domain/exceptions/failure.dart';
import 'package:pokemon_challenge/domain/repositories/pokemon_repository.dart';
import 'package:pokemon_challenge/domain/services/pokemon_service.dart';

class PokeDetailsUsecases {
  final PokemonRepository pokemonRepository;
  final PokemonService pokemonService;

  PokeDetailsUsecases({
    required this.pokemonRepository,
    required this.pokemonService,
  });

  Future<Either<Failure, Pokemon>> getPokemon(int id) async {
    try {
      final pokemonServ = await pokemonService.findUniqueById(id);
      final pokemonRepo = await pokemonRepository.findUniqueById(id);

      if (pokemonRepo == null) {
        return Right(pokemonServ);
      } else {
        pokemonServ.isFavorite = true;
      }
      return Right(pokemonServ);
    } catch (e, stacktrace) {
      log(
        e.toString(),
        name: 'PokeDetailsUsecases.getPokemon',
        error: e,
        stackTrace: stacktrace,
      );
      return Left(InternalError(message: e.toString()));
    }
  }

  Future<Either<Failure, Pokemon>> favorite(int id) async {
    try {
      final pokemon = await pokemonService.findUniqueById(id);
      pokemon.isFavorite = true;
      await pokemonRepository.addFavorite(pokemon);

      return Right(pokemon);
    } catch (e, stacktrace) {
      log(
        e.toString(),
        name: 'PokeDetailsUsecases.favorite',
        error: e,
        stackTrace: stacktrace,
      );
      return Left(InternalError(message: e.toString()));
    }
  }

  Future<Either<Failure, Pokemon>> unfavorite(int id) async {
    try {
      final pokemon = await pokemonService.findUniqueById(id);
      pokemon.isFavorite = false;
      await pokemonRepository.removeFavorite(id);

      return Right(pokemon);
    } catch (e, stacktrace) {
      log(
        e.toString(),
        name: 'PokeDetailsUsecases.unfavorite',
        error: e,
        stackTrace: stacktrace,
      );
      return Left(InternalError(message: e.toString()));
    }
  }
}
