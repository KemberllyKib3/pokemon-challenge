import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:pokemon_challenge/domain/entities/entities.dart';
import 'package:pokemon_challenge/domain/exceptions/failure.dart';
import 'package:pokemon_challenge/domain/repositories/pokemon_repository.dart';
import 'package:pokemon_challenge/domain/services/pokemon_service.dart';
import 'package:pokemon_challenge/shared/enums.dart';

class FilterUsecases {
  final PokemonRepository pokemonRepository;
  final PokemonService pokemonService;

  FilterUsecases({
    required this.pokemonRepository,
    required this.pokemonService,
  });

  Future<Either<Failure, List<Pokemon>?>> getPokemonsByType(String type) async {
    try {
      final pokemons = await pokemonService.findManyByType(type);
      final favorites = await pokemonRepository.findManyFavorites();

      if (favorites.isEmpty) {
        return Right(pokemons);
      } else {
        for (final pokemon in pokemons) {
          for (final fave in favorites) {
            if (pokemon.id == fave.id) {
              pokemon.isFavorite = true;
            }
          }
        }
      }

      return Right(pokemons);
    } catch (e, stacktrace) {
      log(
        e.toString(),
        name: 'FilterUsecases.getPokemonsByType',
        error: e,
        stackTrace: stacktrace,
      );
      return Left(InternalError(message: e.toString()));
    }
  }

  Future<Either<Failure, List<Pokemon>?>> getPokemonsByHabitat(
      String habitat) async {
    try {
      final pokemons = await pokemonService.findManyByHabitat(habitat);
      final favorites = await pokemonRepository.findManyFavorites();

      if (favorites.isEmpty) {
        return Right(pokemons);
      } else {
        for (final pokemon in pokemons) {
          for (final fave in favorites) {
            if (pokemon.id == fave.id) {
              pokemon.isFavorite = true;
            }
          }
        }
      }
      return Right(pokemons);
    } catch (e, stacktrace) {
      log(
        e.toString(),
        name: 'FilterUsecases.getPokemonsByHabitat',
        error: e,
        stackTrace: stacktrace,
      );
      return Left(InternalError(message: e.toString()));
    }
  }

  Future<Either<Failure, Pokemon?>> getPokemonsByName(String name) async {
    try {
      final pokemon = await pokemonService.findManyByName(name);
      final favorite = await pokemonRepository.findUniqueById(pokemon!.id);

      if (favorite != null) {
        pokemon.isFavorite = true;
        return Right(pokemon);
      }
      return Right(pokemon);
    } catch (e, stacktrace) {
      log(
        e.toString(),
        name: 'FilterUsecases.getPokemonsBySearch',
        error: e,
        stackTrace: stacktrace,
      );
      return Left(InternalError(message: e.toString()));
    }
  }

  Future<Either<Failure, List<String>>> getFilterItems(
      TypeFilter typeFilter) async {
    try {
      List<String> items;
      if (typeFilter == TypeFilter.habitat) {
        items = await pokemonService.findManyHabitats();
      } else {
        items = await pokemonService.findManyTypes();
      }
      return Right(items);
    } catch (e, stacktrace) {
      log(
        e.toString(),
        name: 'FilterUsecases.getFilterItems',
        error: e,
        stackTrace: stacktrace,
      );
      return Left(InternalError(message: e.toString()));
    }
  }
}
