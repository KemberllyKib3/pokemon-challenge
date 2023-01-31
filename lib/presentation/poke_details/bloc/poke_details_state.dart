import 'package:pokemon_challenge/domain/entities/entities.dart';

class PokeDetailsState {
  final bool isLoading;
  final bool isSuccess;
  final bool isFailure;
  final String? error;
  final Pokemon? pokemon;

  PokeDetailsState({
    required this.isLoading,
    required this.isSuccess,
    required this.isFailure,
    required this.error,
    required this.pokemon,
  });

  factory PokeDetailsState.loading() {
    return PokeDetailsState(
      isLoading: true,
      isSuccess: false,
      isFailure: false,
      error: null,
      pokemon: null,
    );
  }

  factory PokeDetailsState.failure(String error) {
    return PokeDetailsState(
      isLoading: false,
      isSuccess: false,
      isFailure: true,
      error: error,
      pokemon: null,
    );
  }

  factory PokeDetailsState.success({required Pokemon pokemon}) {
    return PokeDetailsState(
      isLoading: false,
      isSuccess: true,
      isFailure: false,
      error: null,
      pokemon: pokemon,
    );
  }
}
