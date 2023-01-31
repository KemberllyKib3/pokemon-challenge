import 'package:pokemon_challenge/domain/entities/entities.dart';

class FilterState {
  final bool isLoading;
  final bool isSuccess;
  final bool isFailure;
  final String? error;
  final List<String>? items;
  final List<Pokemon>? pokemons;

  FilterState({
    required this.isLoading,
    required this.isSuccess,
    required this.isFailure,
    required this.error,
    required this.items,
    required this.pokemons,
  });

  factory FilterState.loading() {
    return FilterState(
      isLoading: true,
      isSuccess: false,
      isFailure: false,
      error: null,
      items: null,
      pokemons: null,
    );
  }

  factory FilterState.failure(String error) {
    return FilterState(
      isLoading: false,
      isSuccess: false,
      isFailure: true,
      error: error,
      items: null,
      pokemons: null,
    );
  }

  factory FilterState.success({required List<Pokemon> pokemons}) {
    return FilterState(
      isLoading: false,
      isSuccess: true,
      isFailure: false,
      error: null,
      items: null,
      pokemons: pokemons,
    );
  }

  factory FilterState.filter({required List<String> items}) {
    return FilterState(
      isLoading: false,
      isSuccess: true,
      isFailure: false,
      error: null,
      items: items,
      pokemons: null,
    );
  }
}
