import 'package:get_it/get_it.dart';
import 'package:pokemon_challenge/data/datasources/hive/pokemon_datasource_impl.dart';
import 'package:pokemon_challenge/data/datasources/pokemon_datasource.dart';

import 'package:pokemon_challenge/data/repositories/pokemon_repository_impl.dart';
import 'package:pokemon_challenge/data/services/pokemon_service_impl.dart';
import 'package:pokemon_challenge/domain/repositories/pokemon_repository.dart';
import 'package:pokemon_challenge/domain/services/pokemon_service.dart';
import 'package:pokemon_challenge/domain/usecases/home_usecases.dart';
import 'package:pokemon_challenge/domain/usecases/poke_details_usecases.dart';
import 'package:pokemon_challenge/presentation/home/bloc/home.dart';
import 'package:pokemon_challenge/presentation/poke_details/bloc/poke_details_bloc.dart';

final GetIt getIt = GetIt.instance;

Future<void> init() async {
  // Blocs
  getIt.registerFactory(() => HomeBloc(homeUsecases: getIt()));
  getIt.registerFactory(() => PokeDetailsBloc(pokeDetailsUsecases: getIt()));

  // Services
  getIt.registerFactory<PokemonService>(() => PokemonServiceImpl());

  // Repositories
  getIt.registerFactory<PokemonRepository>(() => PokemonRepositoryImpl());

  // Datasources
  getIt.registerFactory<PokemonDatasource>(() => PokemonDatasourceImpl());

  // UseCases
  getIt.registerFactory(
    () => HomeUsecases(
      pokemonRepository: getIt(),
      pokemonService: getIt(),
    ),
  );
  getIt.registerFactory(
    () => PokeDetailsUsecases(
      pokemonRepository: getIt(),
      pokemonService: getIt(),
    ),
  );
}
