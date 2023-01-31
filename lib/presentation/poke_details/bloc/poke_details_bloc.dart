import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_challenge/domain/usecases/poke_details_usecases.dart';
import 'package:pokemon_challenge/presentation/poke_details/bloc/poke_details.dart';

class PokeDetailsBloc extends Bloc<PokeDetailsEvent, PokeDetailsState> {
  final PokeDetailsUsecases pokeDetailsUsecases;

  PokeDetailsBloc({required this.pokeDetailsUsecases})
      : super(PokeDetailsState.loading()) {
    on<PokeDetailsInitEvent>(_onPokeDetailsInitEvent);
    on<MarkFavoriteEvent>(_onMarkFavoriteEvent);
    on<UnmarkFavoriteEvent>(_onUnmarkFavoriteEvent);
  }

  void _onPokeDetailsInitEvent(
      PokeDetailsInitEvent event, Emitter<PokeDetailsState> emit) async {
    emit(PokeDetailsState.loading());
    final result = await pokeDetailsUsecases.getPokemon(event.id);
    result.fold(
      (failure) => emit(PokeDetailsState.failure(failure.message)),
      (pokemon) => emit(PokeDetailsState.success(pokemon: pokemon)),
    );
  }
  
  void _onMarkFavoriteEvent(
      MarkFavoriteEvent event, Emitter<PokeDetailsState> emit) async {
    emit(PokeDetailsState.loading());
    final result = await pokeDetailsUsecases.favorite(event.id);
    result.fold(
      (failure) => emit(PokeDetailsState.failure(failure.message)),
      (pokemon) => emit(PokeDetailsState.success(pokemon: pokemon)),
    );
  }
  
  void _onUnmarkFavoriteEvent(
      UnmarkFavoriteEvent event, Emitter<PokeDetailsState> emit) async {
    emit(PokeDetailsState.loading());
    final result = await pokeDetailsUsecases.unfavorite(event.id);
    result.fold(
      (failure) => emit(PokeDetailsState.failure(failure.message)),
      (pokemon) => emit(PokeDetailsState.success(pokemon: pokemon)),
    );
  }
}
