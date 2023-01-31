import 'package:pokemon_challenge/domain/entities/entities.dart';

class HomeState {
  final bool isLoading;
  final bool isSuccess;
  final bool isFailure;
  final String? error;
  final List<Pokemon>? pokemons;

  HomeState({
    required this.isLoading,
    required this.isSuccess,
    required this.isFailure,
    required this.error,
    required this.pokemons,
  });

  factory HomeState.loading() {
    return HomeState(
      isLoading: true,
      isSuccess: false,
      isFailure: false,
      error: null,
      pokemons: null,
    );
  }

  factory HomeState.failure(String error) {
    return HomeState(
      isLoading: false,
      isSuccess: false,
      isFailure: true,
      error: error,
      pokemons: null,
    );
  }

  factory HomeState.success({required List<Pokemon> pokemons}) {
    return HomeState(
      isLoading: false,
      isSuccess: true,
      isFailure: false,
      error: null,
      pokemons: pokemons,
    );
  }
}
